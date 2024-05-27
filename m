Return-Path: <linux-renesas-soc+bounces-5500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDF38D0111
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 15:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC97EB26715
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 13:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEFC15E5BE;
	Mon, 27 May 2024 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="0+XyQeen";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ugh1+jwi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2743D381C2;
	Mon, 27 May 2024 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716815786; cv=none; b=hs8XKRb7UpiP5O/5UFo2wgkmkWrOBld9A9rY2dur8IeP3SYPDsuN0/xJXhrkQUG6snYCuccOELlAI4skv7Nwre4Jv3OBJubuaYEhIVz6yKeo/uVyfhUckJgp56LWcIAtCY0CS/KRohDF+NByBru+H3+OeLfHk48HjRuI42xWABs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716815786; c=relaxed/simple;
	bh=R/OneJziyYEIPs2WbvG47t24NVUNI9+W8f9IhIIzpto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B33dJFkUU2gg7iR7f3W6Fsd629vZ3k4ES4caoyUtmrezWqnXtACqMwd5nDlfI7kPKCrJjiGKhG7F3mFHHu3v4LYgctDv2EmJ0P210Vsb7WtcvIZ6WLyopiDPRJUxv7/rAvrq8D2qe/Bdqf/ZP4P/gr0cu2hRqjv8UPvqOHK6JP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=0+XyQeen; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ugh1+jwi; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id D56461C000EC;
	Mon, 27 May 2024 09:16:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 27 May 2024 09:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1716815780; x=1716902180; bh=zy
	wvxfbcTGD1V7RbHCN8+6z15ThneUF2w4QaMxRcq4A=; b=0+XyQeeniLJZJUJVs0
	qr9lAZ7GHAH26BWEuJqkW1XmgCvzg2iJEWLt3w4qCvO2A1roSp89VSiIpkcr+2G/
	XuQDn93jpGkyKa8brI7cMXY2eyeRBodUSEjUSs30IS5RrvAzK+Bflmtb4Dxh4xbQ
	1Rj6sb6jkJSHrie7+HKDSroEA92msIbcXTTBywKyqOTG5duBDKWlBpyBhX737Za9
	ICE8uOVoQw3lna4eIwgQauanGnyBpc+RrKMCfb0GqiW/c1GalhVQ5paPRzClbIzj
	gGqAVsppXOFFdjzdKc6MtZvr5kXxiyEnpovEUhRl2v6lymn909jMU8jm4X8EKiDz
	4/Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1716815780; x=1716902180; bh=zywvxfbcTGD1V
	7RbHCN8+6z15ThneUF2w4QaMxRcq4A=; b=Ugh1+jwiH6UbdRJ3CRtvjRE0ToXk3
	4yCTNG0DtJplmO7rAxFGPsdtpHxYQhsSnsY0tz98u3xZEVv+qoF+kV2nXBtUhE6J
	s+3hr2/OsguR8FNzofdEqby9NYGbP1wzkTwg/mEkVqO1UyslmYSmuRd9FmHB4Pa0
	rJwjbyAJqI0NxOH0q7GdWbWPAZDs49LNfH+9t08/nnVgjYiwCIiNEtLnQA+Xkib3
	OrdwDyDlhFEcWnVD4osXB2tqC9050xYhj9zlt1PMsxVYwNgnqj2SMmyILnqnRQoP
	SaY4V7CbHbxwuF8PUifkNRmHZKw6sXvJIOY1wgfupB3e3NhIatnfMP+wQ==
X-ME-Sender: <xms:pIdUZhVNfhr6ClskRWSBCH6eBvG6bb08GnvlTmmE7D8lEdaqsTaLlQ>
    <xme:pIdUZhnMWU4qgtrJxRwQMGDTAfm9m7gddtIpbcD2kb94E9K2UVhfXH2mc7Cov4Cof
    Phcr6iMGyGQ5n2BKBQ>
X-ME-Received: <xmr:pIdUZta0Btbd3pElDbhqwnn0190xvCShBSHJopXmVWdXT2_zWyE_gf5aBd8JuwcLuxzosgIwSNUXQT0yfly2yx6um9wkBkQ7_Dem>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffogggtgfesthekre
    dtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghs
    rdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecugg
    ftrfgrthhtvghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledt
    vdevhfefteegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgv
    tghhrdhsvg
X-ME-Proxy: <xmx:pIdUZkWvfrVnvd_jFQ5B-GNerzEM23LuXCyLT9k45dpDNcESGlPLdg>
    <xmx:pIdUZrliSL7nGgTuKNhPnOpNCyRJ4h5RWvcJnT6cEisIdIsug9adeg>
    <xmx:pIdUZhfb9v4pzamNDODpJ_gWCZIu4hNgaBj_w_FYDjn5RxZ7HVUi4A>
    <xmx:pIdUZlGEw7WC1EViHf-LfPFL7LqgEW4gjEa3pGnva0OcVlhhYg80Kw>
    <xmx:pIdUZkDsCKEoNOiq8frWa7OOWSJZrp2w_JGrOR-651EeKvqsDUsv7Li->
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:16:19 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] clk: renesas: r8a779h0: Add clocks for video capture
Date: Mon, 27 May 2024 15:15:38 +0200
Message-ID: <20240527131541.1676525-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

These small patches adds the module clocks needed to capture video on 
V4M.

Niklas Söderlund (3):
  clk: renesas: r8a779h0: Add VIN clocks
  clk: renesas: r8a779h0: Add ISPCS clocks
  clk: renesas: r8a779h0: Add CSI-2 clocks

 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

-- 
2.45.1


