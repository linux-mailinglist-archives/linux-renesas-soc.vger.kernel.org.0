Return-Path: <linux-renesas-soc+bounces-27754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id o+nqEaadf2lWugIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Feb 2026 19:38:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65777C6F48
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 01 Feb 2026 19:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1A693004232
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Feb 2026 18:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E5A26ED3F;
	Sun,  1 Feb 2026 18:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="CEuxUVSZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q5npvgpw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3231DF25F;
	Sun,  1 Feb 2026 18:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769971106; cv=none; b=cSFST5bXdSdRnqD+Wkki4PHZm2AJmVd8Tl9cXtB6NPt6Jw9Q7Db+nUbEcPPO9azJRQlZXzGT4o0+cucDL0WnrsmXErQQF+e5e08Rvozg+IHgjqAwm5/UNWVJQvMlJgOTFOQ8+iYE0lrESFrBAk0YQLN88qfR04ioNWzpbtn/5eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769971106; c=relaxed/simple;
	bh=6xuqKg+GrCudEOVi3hiXo4OVT7nz9eZJ5Z1ERtSYe0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i8Sl94mWUHmo4Q1W6/1VA1Dho9lDWVl0I8o+CXq+x05SiH4jIvJDYuF6k90OvJtshM7dhsuHyMG+hHO+jOCLhxIzx54JFpm+/wgdV6kzuOUBAoETlOvzXM+DjMqsfcssbAiH/FDUt5Qvn3m2OYPlPXoiPnryP4cPv5R9+gkaROE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=CEuxUVSZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q5npvgpw; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1432E7A00F0;
	Sun,  1 Feb 2026 13:38:23 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 01 Feb 2026 13:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1769971102; x=1770057502; bh=qq
	PX1DAJpcS6WM8ffzRbukkbvsolsaErTSrgi+r6RWY=; b=CEuxUVSZeydQAlVylc
	4G+crhIdjfv2WPI50rk2uNoCZSPtun7W+TCI2YHYk+AgT88nwV2si0kklp6qlLYG
	gvxRrP+pBUiZ5r7IEMLU5pOlOIb4KrEmrL1EB0V3NcXgL3MqIZcns+je4GGllYUx
	Iy7jERwhup193WB+NFePRcXSfhjuuwXoEcooNfuSu+7NdKgBULimDC9ISR7UqlA8
	LJE0SLTdCXsmeRqfoDET3NiMH7D7SNkJY/m67VQPWYJsvtTdwHUIyHijnN2iF/6D
	pDl4MIa2Wmsn0C2+JwmF6SySn0p1iVrfNPZ3uyoQxuf8wzI7xlImtEPpF4Iq+v8S
	vQ6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1769971102; x=1770057502; bh=qqPX1DAJpcS6WM8ffzRbukkbvsol
	saErTSrgi+r6RWY=; b=Q5npvgpwVAUXBg9Pzg0Giv1hXMMgZb24sVZZxsmNX67I
	MX0oz9e4hfqf73y1l5G0E8hI3L4xHB3gibaiNlbI4ZpPyGQ98KWXZCNV5+t763Nc
	UsoIVNS6XOS6LgvF9h/wfGIynoSBNkD1cLjCBJfP3lH/tdgFBJMygcRgjmSm3Ggb
	m8Zqeb6OnyP30hCCXzpAH4HEM3t9bUfizZx5++Lyl6qA8ZI01yTrLI39ttCXXeQF
	Ux1u/AoMYt+OltyzgOHr1kNMOzbI24U/tdwAzpOou86AsCUIMTrCfHO0xCK+qcWC
	RVcQLfGKG1dCuICemQkznLUU/E/Ui1LI9NG6SEU1kw==
X-ME-Sender: <xms:nZ1_aZv_zZS8CUhK1IPLLFXWbJtZo9fz0z_7XTkMeLlMh_RN4-P6Dg>
    <xme:nZ1_aX-tycKJPoFBR5W3kjdLScHN40Mkm9YMCNxNG6FkJPCx3k1c9FBOy6cavTXHl
    MIa1S-KfJ2sUcusBMZy5rsoBABepg9x5ME1Gyx_QZGSpCxqWMd07Q>
X-ME-Received: <xmr:nZ1_ab3K0V9KwwfFgerElfSAD6WEapW-eBymaB_GLINy6Fc04LWa7vz0gG0bZCHrOyliJ2MIcowgSypXqTUWbxtx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeehheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffef
    udefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohephihoshhhihhhihhrohdrshhhihhmohgurgdruhhhsehr
    vghnvghsrghsrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunh
    hnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghp
    thhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtgho
    mhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtg
    hpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopehr
    ihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:nZ1_aUguTt7lAIoBh-QsHpuF96J2djQm42I1TmmjcTRVRUY9_YXy_g>
    <xmx:nZ1_aTbjqFFJgAyvaQ-AqKpQniVRrjtGRt8wrQ2u-wmMaSKpmWQLYQ>
    <xmx:nZ1_aYVjw0cs76IRyzrL2WrortxJnOCA2qc-hR_1bAhlgl9UARDSbg>
    <xmx:nZ1_aTF9pJN-6VQ5MPmCrjSAIxzHbFh_kuHD77P2urmGNmWUQnA96g>
    <xmx:np1_aeTproz9uE6hbflPNcgGteAFCGcGdFfbqOuHmUoJAXTtKkdtUPSx>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Feb 2026 13:38:20 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 0/4] net: ethernet: renesas: rcar_gen4_ptp: Hide private data
Date: Sun,  1 Feb 2026 19:37:41 +0100
Message-ID: <20260201183745.1075399-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27754-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 65777C6F48
X-Rspamd-Action: no action

Hello,

The R-Car Gen4 PTP module started out as an exclusive feature of a 
single driver, but have since been extended to cover both R-Car Switch 
and TSN driver implementations on Gen4.

The feature have already been extended to be built as its own module 
with an interface exposed thru a local header file. The header file 
however also exposes the modules private data structure. The two 
existing users have already started to poke at members of the struct.  

The exposed private data being manipulated by users makes refactoring 
and future rework hard as the interface for the module becomes to 
chaotic. This small series aims to create two helpers to hide the 
private data.

This is done as a small preparation before a third, new, users of the 
Gen4 PTP will be added in a follow up series.

Niklas Söderlund (4):
  net: ethernet: renesas: rcar_gen4_ptp: Move address assignment
  net: ethernet: renesas: rcar_gen4_ptp: Add helper to get clock index
  net: ethernet: renesas: rcar_gen4_ptp: Add helper to read time
  net: ethernet: renesas: rcar_gen4_ptp: Hide private data from users

 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 34 +++++++++++++++++++-
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 18 ++++-------
 drivers/net/ethernet/renesas/rswitch_main.c  | 11 +++----
 drivers/net/ethernet/renesas/rtsn.c          | 30 +++++++----------
 4 files changed, 57 insertions(+), 36 deletions(-)

-- 
2.52.0


