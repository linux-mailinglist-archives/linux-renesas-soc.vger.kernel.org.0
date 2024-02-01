Return-Path: <linux-renesas-soc+bounces-2244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE7D8464E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 01:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A2E2286EFB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 00:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF9623B7;
	Fri,  2 Feb 2024 00:09:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from 3.mo575.mail-out.ovh.net (3.mo575.mail-out.ovh.net [46.105.58.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A58520F7
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Feb 2024 00:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.58.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706832596; cv=none; b=lRzjwVu6iYrX6ri682TiBJ1JueUE777VBQ8Vtg7GoFTv9HnL2h3XqVIeQaIDDh3QR5lODW+b2KL2ukwJxLUa7qFW+tvc9TtgaVsKCz2R7Uqe+Elrr0jIXFP9BfHghHiIaz/8aJYXdr10sUJjB+h03sOCniGVfw7KccH7S+O0hSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706832596; c=relaxed/simple;
	bh=NMeAuujbuy3EkPNZy05vHU5dHQiyG2b+TGQMQO7TDAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=esymysbwCA7O3ql6O2y610snE+/AVG6OLONTygEr0QxgHtRHne4WyyazFAIHug3O1Qnrg/yhpzqp5sFdp1+jFzjEHJybzg5TqO2h0h5awhNdQrxE7knV+5ywTinH2DCaTcQ1XFNdLh2/PzXJ7II4raLTM92Zmyl6RS1iptjFlWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.58.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.17.245])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 798372AA64
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 23:33:42 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-9k6nq (unknown [10.110.168.153])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3893C1FD3E;
	Thu,  1 Feb 2024 23:33:39 +0000 (UTC)
Received: from etezian.org ([37.59.142.107])
	by ghost-submission-6684bf9d7b-9k6nq with ESMTPSA
	id YvgFLVMqvGVfEQAABT/CVQ
	(envelope-from <andi@etezian.org>); Thu, 01 Feb 2024 23:33:39 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-107S001ebff1c2f-e954-4357-937e-167c0ab9448d,
                    16159D31D4BC2DC989EAC12674B0EBCF52923421) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <b83a745334b0aea8bffae5a41db2543100ad5e30.1706789816.git.geert+renesas@glider.be>
References: <b83a745334b0aea8bffae5a41db2543100ad5e30.1706789816.git.geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: i2c: renesas,rcar-i2c: Add r8a779h0
 support
Message-Id: <170683041891.3022989.9793680074411882524.b4-ty@kernel.org>
Date: Fri, 02 Feb 2024 00:33:38 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
X-Ovh-Tracer-Id: 3050625797600315924
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrfeduvddgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth

Hi

On Thu, 01 Feb 2024 13:18:51 +0100, Geert Uytterhoeven wrote:
> Document support for the I2C Bus Interfaces in the Renesas R-Car V4M
> (R8A779H0) SoC.
> 
> 

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] dt-bindings: i2c: renesas,rcar-i2c: Add r8a779h0 support
      commit: 4b5cb5c1a346d4e5e35a1032ff0a1e8dd3b27052


