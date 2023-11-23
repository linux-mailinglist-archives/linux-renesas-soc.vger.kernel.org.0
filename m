Return-Path: <linux-renesas-soc+bounces-170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB487F5ABB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 10:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F103DB20C8E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 09:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CD01CF99;
	Thu, 23 Nov 2023 09:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRjMaWL/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35D01C6A8;
	Thu, 23 Nov 2023 09:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517C6C433C8;
	Thu, 23 Nov 2023 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700730319;
	bh=l6l7rfNq9C2pJ8qB1srfSPaHh2HKOoGwoK/QaWH8w+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SRjMaWL/92cYdhNlQ885lbenxszEoiFC7usN8UAnmAzplSCGGVhkyA7DbBI9Sc+42
	 yf+dkCw3nHh589t8rJw9E+i+Yr5fqRyuE7e5ibjCvk2tSSjqT3jO2UBJYjX+vjK2f6
	 3PQui++wYwvzZtlhO2p49EITbVUkhMqPFzrAsIYe7jvbmTije9IEB+OP9eneTQMYLQ
	 k/Wo3tZo6yqURBptLfCyrTwuAHVfJn8TZiS5NxZH/uaO2ymC3XyFtcV5NAEQqEaMTz
	 6k8ZPWBtKYfaKsEU2WHbXRXP9zQUuXfbr8nGY9KuRzrqZBGqEQ2z86FS+F14KmJZXA
	 2/wIX1GsTVE1Q==
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <56a5ebee588696f9022fa29fa8e266c8bdee6fd7.1698228043.git.geert+renesas@glider.be>
References: <56a5ebee588696f9022fa29fa8e266c8bdee6fd7.1698228043.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: ams,as3711: Convert to
 json-schema
Message-Id: <170073031703.1185179.18008578184817685295.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 09:05:17 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Wed, 25 Oct 2023 12:02:34 +0200, Geert Uytterhoeven wrote:
> Convert the Austria MicroSystems AS3711 Quad Buck High Current PMIC with
> Charger Device Tree binding documentation to json-schema.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mfd: ams,as3711: Convert to json-schema
      commit: ad7531e58b88eb92032d11c166dd544c434ce3c5

--
Lee Jones [李琼斯]


