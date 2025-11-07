Return-Path: <linux-renesas-soc+bounces-24343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B90A7C417E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 21:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EAD6189BBA6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 20:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C4F27CB02;
	Fri,  7 Nov 2025 20:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="b7vTCsEr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qdS6siAG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3B123C516;
	Fri,  7 Nov 2025 20:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762545802; cv=none; b=uWOPraKA+Bba1gMADIkn+rgi1111s8M8fqFbScknjiuOn44MAaSNeGFdUOztk3hgUpTobnDR+qhnFEMmcQaRcjLvJJwyQvDznnwQCmz+w8yOyICfraChWLmJYnpyP6JcEixjpkXDa0Gz3jZkATEP426PrT50iPrpKTCyxjyCgr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762545802; c=relaxed/simple;
	bh=KCZijJglXxIG/AS1zvIgLSx+vHs8R/9rZN2j7qg3nj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lAzDgoIT7xB+3bxBpverzcz+8firHewVgRu4rQ9qOz8ylEmzoy6ZmbanjD+lQE1ClXLGH24La4XWgeFh9toSs00J2gzFXb+OJserfC8dRtC/uCdP19g9z06bgiz55jtICZ8icCurPn814GCS3w1dZC8DxmIa8yd/puX77ESw37c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=b7vTCsEr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qdS6siAG; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id D5B6F1D00178;
	Fri,  7 Nov 2025 15:03:19 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 07 Nov 2025 15:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1762545799; x=1762632199; bh=LO
	ZtvgeXJcBdFcjifyotcfEbZB5d8f9h3K/ONADO/Q0=; b=b7vTCsErf8Ui9LhE6J
	D3YqMxAGOuXwVu7tOal/b1hcTfXStpxq7T1YbHpV3vfHHiVlQ0ph2VwEGxPxiNGZ
	W+zw9dYn21+x17urbclAhnmExpqXQHS/rdzCftc2SXwN6btb0dZAt+r8ZdyCqTLy
	QpuVZrGkzDrPnt24MGZRW0E8iiacVupdDaI4iqR/Zuzl9T+qDfvkUxd8CF4fLeiu
	Arqs0Y/qigPuyJdyr7ZxPnhrXqk+vhwv7vaA6c9CRt4RMslwIqb168LtaJcBVeNg
	AnPzEny2MNWU5mRq6hORBPMyjdPNccCNQAoqbMfrdzwreL07Oh9sbKwSfZevkSjE
	gLRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1762545799; x=1762632199; bh=LOZtvgeXJcBdFcjifyotcfEbZB5d
	8f9h3K/ONADO/Q0=; b=qdS6siAGyLPKv8BHBQTa7yyL3JZnhUHiN20mJYEezRAy
	7tlV3jWnimTggOHAzlHMCpcFNSrGQRrbdpMKpXcgVFqjR6qeTtgoRtIWnyHPxk7k
	B4yhI2ifnbjoKqlDaEnlsh9FPd+pyCjFtnwqGnlU9XvFQqXphNGIymRKuVVRscZl
	+ot7YWNoAjHjQOem9LY2WEpuH7E7j5qgXOkTHtBKUIffbs8TjOm6uDSDuENrKusp
	ALzaD+Yla9tupiU7CzpJRJlhL3rSdFaPR9ZhP5pMPRjCmqBJhyOvJ9Y2KvnOTvk5
	F0krWUq387dYXIRLRbY3elQukLfVFBT3/pGioj1EpA==
X-ME-Sender: <xms:hlAOaez-IoqZEsQnDpc9FTBrum7wqPwKgUSKlrT3W93A_1QM5WiVmw>
    <xme:hlAOaffZ_hsGrT0TGzMlrIN02aCiqNolj-JYL34UFro2lyMFtML9WkYveO1yfiMIN
    oA18tpq6GbBCl0mp54tHcIG1AHCvnSu7IxKaM5BbDslDb4IyLV6YZQ>
X-ME-Received: <xmr:hlAOaTtAdSRka2kHLkd4Ae8YP7GtCV29wri-78vJHpN3Cujd1mBA26ZAz0QfTk4CL_Bla3r1Y1O_fw_m3en4nVGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduledtheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpefhgefhveeghfetudeh
    fffhjeeileehkedvveffuddtleegudegjeeufeefvefftdenucffohhmrghinhepkhgvrh
    hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnh
    gspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhohhr
    mhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhesphgsrghrkhgvrhdrug
    gvvhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghp
    thhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumh
    griigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoh
    ephihoshhhihhhihhrohdrshhhihhmohgurgdruhhhsehrvghnvghsrghsrdgtohhmpdhr
    tghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvg
X-ME-Proxy: <xmx:hlAOaUCaI9z_WoRu5LMrWvHiHAtrTSPCg9oKeWCUG70j22Resdymyg>
    <xmx:hlAOabHAOU2RdrOCMh4u5N6gTmS_1Le7DIEII3jGaesyoluiOnQqjw>
    <xmx:hlAOaUuRwib9Dq-gkghBt8hD7Zct3aVaXhtxVuKJnCuAVFAWT3JRWg>
    <xmx:hlAOaRnQQI251qh3vhttxiJJp9YT6csBFtFQyskRDDZVkzrQ1xZdgQ>
    <xmx:h1AOaTHfiC7TGlWv3ST0MorZZQM2i2KXQ1q_aD5grV14YQHYL_hc3PXO>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Nov 2025 15:03:18 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Simon Horman <horms@kernel.org>,
	Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] net: ravb: Correct bad check of timestamp control flags
Date: Fri,  7 Nov 2025 21:01:00 +0100
Message-ID: <20251107200100.3637869-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When converting the Renesas network drivers to use flags from enum
hwtstamp_rx_filters to control when to timestamp packages instead of a
driver specific schema with bit-wise flags an error was made.

The bit-wise driver specific flags correct logic to set get_ts was:

  q: RAVB_BE + tstamp_rx_ctrl: 0 => 0
  q: RAVB_NC + tstamp_rx_ctrl: 0 => 0
  q: RAVB_BE + tstamp_rx_ctrl: RAVB_RXTSTAMP_TYPE_V2_L2_EVENT => 0
  q: RAVB_NC + tstamp_rx_ctrl: RAVB_RXTSTAMP_TYPE_V2_L2_EVENT => 1
  q: RAVB_BE + tstamp_rx_ctrl: RAVB_RXTSTAMP_TYPE_ALL => 1
  q: RAVB_NC + tstamp_rx_ctrl: RAVB_RXTSTAMP_TYPE_ALL => 1

The converted logic to use enum flags mapped tstamp_rx_ctrl as

  0 to HWTSTAMP_FILTER_NONE
  RAVB_RXTSTAMP_TYPE_V2_L2_EVENT to HWTSTAMP_FILTER_PTP_V2_L2_EVENT
  RAVB_RXTSTAMP_TYPE_ALL to HWTSTAMP_FILTER_ALL

But the logic was incorrectly changed to:

  q: RAVB_BE + tstamp_rx_ctrl: HWTSTAMP_FILTER_NONE => 1 (error)
  q: RAVB_NC + tstamp_rx_ctrl: HWTSTAMP_FILTER_NONE => 0
  q: RAVB_BE + tstamp_rx_ctrl: HWTSTAMP_FILTER_PTP_V2_L2_EVENT => 0
  q: RAVB_NC + tstamp_rx_ctrl: HWTSTAMP_FILTER_PTP_V2_L2_EVENT => 1
  q: RAVB_BE + tstamp_rx_ctrl: HWTSTAMP_FILTER_ALL => 1
  q: RAVB_NC + tstamp_rx_ctrl: HWTSTAMP_FILTER_ALL => 0 (error)

This change restores the converted flag check to the correct logic of
the bit-wise driver specific flags.

Reported-by: Simon Horman <horms@kernel.org>
Closes: https://lore.kernel.org/linux-renesas-soc/aQ4xSv9629XF-Bt3@horms.kernel.org/
Fixes: 16e2e6cf75e6 ("net: ravb: Use common defines for time stamping control")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Hi,

See link in the closes tag for details on how this was found.

I added a fixes tag to this patch, however the patch that introduces the
error is in net-next, so there is no stable tree to port this fix to.

I'm sorry I made such a clumsy mistake. I'm happy Simon happened to try
out a new tool on this one commit so this issue could be fixed quickly.

Thanks Simon!
---
 drivers/net/ethernet/renesas/ravb_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 1680e94b9242..57b0db314fb5 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -955,9 +955,9 @@ static void ravb_rx_rcar_hwstamp(struct ravb_private *priv, int q,
 	bool get_ts;
 
 	if (q == RAVB_NC)
-		get_ts = priv->tstamp_rx_ctrl == HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
+		get_ts = priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE;
 	else
-		get_ts = priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
+		get_ts = priv->tstamp_rx_ctrl == HWTSTAMP_FILTER_ALL;
 
 	if (!get_ts)
 		return;
-- 
2.51.1


