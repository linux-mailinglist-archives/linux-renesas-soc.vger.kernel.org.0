Return-Path: <linux-renesas-soc+bounces-6946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2483291E2CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 16:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDD6E1F222ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 14:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B0F16C868;
	Mon,  1 Jul 2024 14:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="c+HRf1kX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Sptzq4Yt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAC816C862;
	Mon,  1 Jul 2024 14:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719845441; cv=none; b=rwMVtYUkLYLn0KhhI4JTOVwZe38BsjA0LwUqVNJJnZroEZ84gpPu70siwucwq8lTN27m3+nT3Aw+iPsV08JjobArTViLyaVoKhBr18e7zJCnQEakZoOgl6bEU4jPlK4u9nXHw1wWZeX17ZXOIotNZPwb/+n3YrUQIMWqHZIOFVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719845441; c=relaxed/simple;
	bh=lqNJgRZVCqett9Zk9kqGYRpCqBaUkNvDORVqzyTkXSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y/47a3HGSsf+mPakZn8tMPa4dG0ieTv9IzsbEJoQa2KfOb+PUJcXx2nBrD3MZoV09i5CC7fD+CRAJZ+mWhLJHNgt8ILyRzacbzWOJWkY3a8jFUQQ1FkWJjcw74Srg62gQDA/eaZa/sQ5/7X/mE/lVEGq1FWQsTPrbsC/jKIUjF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=c+HRf1kX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Sptzq4Yt; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id A480413801A4;
	Mon,  1 Jul 2024 10:50:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 01 Jul 2024 10:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1719845436; x=1719931836; bh=4g
	yw0bRmGJFMnwEIgYIFb+WOUbWqP8R90VEDOz0OpZQ=; b=c+HRf1kXEhNyh/R9M4
	EgX/alPrkyAWJPIWF67Vme8j3AJTBGVv1Jw9v4TCAO0DWK3sP7U1z6LOIafuRqNH
	FSAhRE2uKuwX/f1OGZc5zS1R8nv30PDFEkXqz5jJryFlLHawtsE2Eu5GObOK6/dY
	TvuH8ZC9GQCVxcVwQy0i5IYz81CX0kvVHhg1ZUGTxpEGdq/rMu1XJolc7og5Jbay
	5OxFGz5IQRxp9lNqRHd2lKOkpTKlBhL78a0PZp3YSRldMqUYB12jNuYwe0Lcz1Rd
	MAsslSWJGcEn75Rkb4vg3pks6/VxtCpuZ4/+Pru+h9/3MB4f2P/Gs3tzkQnwUinz
	ft6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1719845436; x=1719931836; bh=4gyw0bRmGJFMn
	wEIgYIFb+WOUbWqP8R90VEDOz0OpZQ=; b=Sptzq4YtojJFwybd9LqFk6iHP4oo8
	Du2MLPJMOe4WuChT6ElUqCkt89DHNlrBxKCr/HoSJTTzxDTFdx1C1HPWN51iHvOr
	8hfifkMuel/rC5AWxEcvPNLt6ANRJZ21AO6HVn2gy5ShR41RnJd1ogcZUmSTb7m1
	PEUJUzAD3+8DOkF3iiAnm9eb8jm66QwFmnDu9sPNnAhir3neRHd01Zm8at2hpmtp
	NuqidoYmfM7i8EJo3S1nfkZfelLcacfeekNY3mXBo8OSEsa6frVNoAR8JkN/uatd
	2Qg0/4ncgggMBfb5SG0V1F7hvSK2EGnG2rqKDPI9T9ayV1wC2JD7VAEng==
X-ME-Sender: <xms:O8KCZgNnEAMdSwjzeBjNt50RNYrdDtIKZVoJbFIwygtp-3lQmvIIlA>
    <xme:O8KCZm-qQuOqnaaQrH5IkxxTMYvkXtlsEVRwtmDTGui0mpl4O23NeV2q612Z298r4
    gX396AWpM0inMlQMoU>
X-ME-Received: <xmr:O8KCZnSjNgCO9Bl55EUbyx1P5SfXiytZR9SHrB_GHD0MPBHePkW7E-0fiw4KF5R94VIojsGgSWth6PNeHVw_DmSyQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgfff
    fedufeeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:O8KCZos88bkW7DGJd3PkTNjYfuNqUSO2ZPFNeBZn92HfK2p1pE1bSA>
    <xmx:O8KCZodtg37l3QQuoPhv605mv6NvVT2HWzYgEFvEeJjVeqw0gy5CVA>
    <xmx:O8KCZs2It319L1EyD_mxWd2C3SaT3OyEeIAN8fWlu540gCBpEzZE1w>
    <xmx:O8KCZs_-psFVXX_CkNq7BAkSddUpFpA2bNy3Hs6DNSm_gBrijFpOlQ>
    <xmx:PMKCZmuu9wXknBBl6JfJHec7cqzyEUAoQBF3w0nY-42drUDgzJyjQv8Y>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Jul 2024 10:50:35 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] arm64: dts: renesas: Add TSN support for V4H
Date: Mon,  1 Jul 2024 16:50:10 +0200
Message-ID: <20240701145012.2342868-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Geert,

This series describes the Ethernet TSN on V4H. The first patch adds the 
device to the base DTSI, while the second wires it up for the White Hawk 
Single board.

In v1 of this series patch 2 added an DT overlay for the White Hawk 
Ethernet sub-board. As this is hard to test and I now have access to 
Single board where testing is easier v2 targets the Single board. I 
still plan to follow up with the overlay for the Ethernet sub-board in 
the future.

Niklas Söderlund (2):
  arm64: dts: renesas: r8a779g0: R-Car Ethernet TSN support
  arm64: dts: renesas: white-hawk-single: Wire-up Ethernet TSN

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 14 +++++
 .../renesas/r8a779g2-white-hawk-single.dts    | 51 +++++++++++++++++++
 2 files changed, 65 insertions(+)

-- 
2.45.2


