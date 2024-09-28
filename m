Return-Path: <linux-renesas-soc+bounces-9176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CAA988ED5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Sep 2024 11:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6A191F21758
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Sep 2024 09:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368A319F138;
	Sat, 28 Sep 2024 09:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gyNlIT83"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D780C19F10F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Sep 2024 09:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727515814; cv=none; b=ICfEWHJokpOJ4FJ8lzv8Dq8XqU19LSyvaLe4JJlTlN/XFY2/FCn6iSKDc8OcE2veR4OOypJx4r40giO8EDWHoOkH/POJJU7+pTWaO0fKQ6VUEW50APHq36sbEk5xEdQys37dXTdrQAGL/4JCBrbXjbtECAwchzweW5Qs8gGYuXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727515814; c=relaxed/simple;
	bh=Vuqp+q9o4nBqrcfa18zikjQZmzHSYSaWrybyrU96eNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PeqpZpa2mhZ4/IvirGuUZ57MRPIxOseBwDEBUrDpc6RYDFoZaUyXf0RZNdrDkvj75S5aCcrctfhYaOx8IdinL7HJFC0Un3prwJoy4Hj4H4A/lUAlgKdBAMm4zvhJcEFjN4l9snSq4+zxDCBQkbtWRqlrebQ/k7gGZZ3A3vivO10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gyNlIT83; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=3wlYkNdzOcOftv
	EDIwBVGPleYIAPh9pfBgQXi5YhrDg=; b=gyNlIT834pm5rd3ztmjHK43tjl/dd1
	taLLPGv3wvR/6iLcwHC16EkKIShQs+VfR4eB8cM0qndUQjhEkRHAcC1pb2c8NNnz
	qoK4fbm3o4NvQo6jVyyu3UWZmuefYN6t1xcU2I92IzgQMYN156wefm6mVqe+TEO2
	w726W5CwrlZevPJ9G9tqb5oTbDKyDKOgn3jUYrkrEN8lPHb6rUNL4fk5KaK36bwp
	wGaVYLU3ZEo1vca1bxZZZ6ERLW7mWgAmt6jq3esHWxu050HW2yq+DqSIBNuVSJAn
	J/VIBagmsQfz/w1jzYwx0C1uJzUfKJ63Et26bm6dEfQiqUvlEwBt7XQA==
Received: (qmail 1576628 invoked from network); 28 Sep 2024 11:30:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2024 11:30:06 +0200
X-UD-Smtp-Session: l3s3148p1@7ov1nSojuOIgAQnoAHS0AAL7owIOnAiN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/3] ARM: dts: renesas: genmai: enable SDHI and MMCIF
Date: Sat, 28 Sep 2024 11:29:53 +0200
Message-ID: <20240928092953.2982-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here are the improved patches to enable SDHI and MMCIF for the Genmai
board.

Changes since v1 (all in patch 3):
* renamed regulator to match schematics
* added "boot-on" property to regulator node
* added vqmmc-property to mmc node

A branch with all my Genmai-related patches can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/genmai-upstreaming

Thanks and happy hacking!


Wolfram Sang (3):
  ARM: dts: renesas: genmai: enable SDHI0
  ARM: dts: renesas: r7s72100: 'bus-width' is a board property
  ARM: dts: renesas: genmai: enable MMCIF

 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 57 ++++++++++++++++++-
 arch/arm/boot/dts/renesas/r7s72100.dtsi       |  1 -
 2 files changed, 56 insertions(+), 2 deletions(-)

-- 
2.45.2


