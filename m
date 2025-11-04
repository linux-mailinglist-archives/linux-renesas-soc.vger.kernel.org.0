Return-Path: <linux-renesas-soc+bounces-24109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D17C333AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 23:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91C7A4659A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 22:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D97E313E2C;
	Tue,  4 Nov 2025 22:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="B9TRVDtI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X51pWP5s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECD7313559;
	Tue,  4 Nov 2025 22:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762295098; cv=none; b=nv0cV+7vHXfQfFYt0l6tnemywFc1Ve0qF+5myUPOdiBxhvhq6r7/VEBLkugOmbWowBDn0PWWmNWgUdz+I6o7N39W+iA9bVtFvfQspRRqFJ7NmKodhW0kUCBLRL+994Qcj+wNu9fhZL/o4MGAcNvXLqtuhQ79Ld8LbtUEQa0raf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762295098; c=relaxed/simple;
	bh=//v0iWfoTdiFtJMg0apUcswaHnf/QcUO70KqDGuA8Ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qF1MEnlJipJDMtN4fQVhY3VZ7iQ6W7Se/nI5N7gQJrVTcUWkfdNZeoWkHnZ4uQZYd98jCKbbvxAisP5OVnK7ArSgueWIjtcKCkUOC1j2F1WHcRa5kxnT0cUL6mzH5LfmSVuqjeUzYcskbm7dbiKzu061nYRpOI8KGtgdGoUcFJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=B9TRVDtI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X51pWP5s; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 894F4EC004E;
	Tue,  4 Nov 2025 17:24:55 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 04 Nov 2025 17:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762295095;
	 x=1762381495; bh=uALWajKzLXHjVAkjWrvI6cq542GMBNzM4/XaNUBLDvw=; b=
	B9TRVDtICNeWWAosdnSVZ/5OXD82CCNQhc0KYBRQt7c38Vb2hqmWBVVXJ10MTkmj
	f89Xf3eMpKy5duuwDUjW435ewmECqItLxp/7qfIh0j+AmJNNgwtSiueD5P3wdxLu
	a2jOHlKigQz6Y7VOwRKg46uXmkLoImjvkLKy19bnAfhmJVUvJSjxNGPeXXEMyGtl
	Ebod61skX9n5WlD5RNNbM/M7KtuD58ZMXmGtDqjoR+aXhnkaJVOhQRZ/I4yJp/NF
	LaNv9X5AU5DW07yZ95jN1tA9Cgn6SCdtjo/LJErrfoYUcUsDEZVuO8uVnSRkKEFj
	9qlVzmRPjYSxcWSSvUFd7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762295095; x=
	1762381495; bh=uALWajKzLXHjVAkjWrvI6cq542GMBNzM4/XaNUBLDvw=; b=X
	51pWP5sBbpXRBU0/p0FM8Bcc5FYG0RP6EBc356G+sTMnt0OtscA7DHCWPzbcvqW1
	wV7xjVrZR/gilxKG4txRYFVfBNECvqexeC/hpTELVO+X31KGfMJyjGc5QzYqEw1E
	2jZAPVCh3OgqW+GVe3Ka/ZN+XdvixnQXXcADolsXgQoHjziK+BPNVae+vJE6Rh5V
	tiA7xCL1MxiyrbN6SwkI2NG0QOA4a9POsMYK9Q3/nH2xF9sTZGmBRxCeO/cUz2mt
	DceeoNtpmSOFEiMAGQcVnrqfUlKMngdaDemKLvWJ9xopAjZbB7AF3ZOHbVaEbtJ1
	xnEXSktRh6J5u7nf/QN8Q==
X-ME-Sender: <xms:N30KafBA0YnJXlOb-lRY4p7oH0ehdC0z0AMa3tYv9zDlU_HloJMb8Q>
    <xme:N30KaauNMNyRqWIlPNaUudX70_q-2UUQYeCsQAVnPoyJZvJSgPaEFwaM9Ui-ug8tD
    7stSvVkFF_YP0oZQ3nk9BzjuHW8E32pinjHx0oI_mzeQa3MlXHOAsSv>
X-ME-Received: <xmr:N30Kad97AmOvenZ9ZfQWWWLKRhmUWgWRBJK3ThK-VamT7NCaifuU7siJS6l0JxIrt56cjgztxH0IZLpptzep6xDE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukedvvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedugedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghp
    thhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurg
    hvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopeihohhshhhi
    hhhirhhordhshhhimhhouggrrdhuhhesrhgvnhgvshgrshdrtghomhdprhgtphhtthhope
    hgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhn
    uhhsrdgurghmmhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:N30KaRRXC5Vn5_iO8UZNoUOAPZZL-9vsgIBPy2jxt8zJoj6llTR7DA>
    <xmx:N30KafWe-yZkZcohgaFcBJKUVIv4B1QEtJ1Or4oopVG7lDkqTA_swg>
    <xmx:N30KaT9Mr-p3g8JPbo3rvlgUKtMT-TXSidbLJZ2xGuYFPxe2Zzowow>
    <xmx:N30Kaf2h85nBa16GBVa5Xa2HEaS0sR8gnvpyfNwsOXGskmqxJFezmA>
    <xmx:N30KafU7gP3ezUFYOSOQtUgcSkcRK1NWorrQ7A_b-FDcy8QhmJdB_QXe>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Nov 2025 17:24:54 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul@pbarker.dev>,
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
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [net-next,v2 5/7] net: rcar_gen4_ptp: Remove unused defines
Date: Tue,  4 Nov 2025 23:24:18 +0100
Message-ID: <20251104222420.882731-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251104222420.882731-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251104222420.882731-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver specific flags to control packet time stamps have all been
replaced by values from enum hwtstamp_tx_types and enum
hwtstamp_rx_filters. Remove the driver specific flags as there are no
more users.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index 1a1e43add129..9a9c232c854e 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -9,15 +9,6 @@
 
 #include <linux/ptp_clock_kernel.h>
 
-/* driver's definitions */
-#define RCAR_GEN4_RXTSTAMP_ENABLED		BIT(0)
-#define RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT	BIT(1)
-#define RCAR_GEN4_RXTSTAMP_TYPE_ALL		(RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT | BIT(2))
-#define RCAR_GEN4_RXTSTAMP_TYPE			RCAR_GEN4_RXTSTAMP_TYPE_ALL
-
-#define RCAR_GEN4_TXTSTAMP_ENABLED		BIT(0)
-
-
 struct rcar_gen4_ptp_private {
 	void __iomem *addr;
 	struct ptp_clock *clock;
-- 
2.51.1


