Return-Path: <linux-renesas-soc+bounces-3087-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E14285F392
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 09:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FB561C20BC2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 08:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77E32C695;
	Thu, 22 Feb 2024 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J7LYGWGz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751372C68A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592148; cv=none; b=tXfve74p2UDPtHN1T97XiJjSsGkmXeC7PJbgDpYQFqGx0O4UWedOorr4Sj3/IG60c+7KyI8B4ZLWcHjfCeZ8f4GKMRLw9LdhkbLoDKRLiM0pAh6evoRgqi1INLhVprWvqIrapR+/V0n5N1z0bxqWQUoIHpllbihQrOPrC0whbCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592148; c=relaxed/simple;
	bh=IcM7smgmshlPZKJJye5knpGquFJahdcma+FIvudzbLo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DzNP9Zv2/O5BXyT8i0KKsXjF4ZFfoq+c+cNpt1S58erW023J4OIskF/zo6RdIuh46SHqyg1gKU3B7mNu0B9ljeQ8X/VwiSdnsVloRNv3EI4LpUaPuaCJw2uC8ETzqR/HPgFoMbKQa2PrE81PiW7KbjGnVRHvhZ4GLekBqRirRtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J7LYGWGz; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-563d56ee65cso8160829a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 00:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708592144; x=1709196944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2xIBE07uRp27zY2uDwM2n5My/GljeuLw0Gdcn3yNZg=;
        b=J7LYGWGzChkTsEDAyRh5zEVArOjgduj7Xblqwpx2/8OI5npTNjONesTLZKOcSu63TA
         0XfBLHTiiUT7ih+cF+yBuC9P+g1NYZ7pnx4zcVLk2yFfxjGghWgnufMqmDyW5tSdav1p
         e9Xw55/E1tAMKQah+qHn9BOi8GPdM6Vq4SmxqlDRMEesK74I2lPp4gyrmqx7gffB/Plj
         QhLeEt/3A0pAGujnnr4WITPczze4F8wT+TX+DRkE9kCABIc2C0m1PMuUiS6hD2KS9O9H
         kPCFZQblD8rnTLGV9gJLB2dQO69p/VRXocingKxj4FoPSNxoRCGHJOzw+HU7zq77qf5e
         IUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708592144; x=1709196944;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2xIBE07uRp27zY2uDwM2n5My/GljeuLw0Gdcn3yNZg=;
        b=SRt+0DZwkwU7dJGRQql+RJQ5KNT11ucEzsuYKx5CXY+u3b75/3KYMMdhS1seifwWkz
         SgKQ0AdbNIdPrUn20++KymskdPObwS6trvw9KMPEJrC8CnZtLhu0Fh6GGobKaue4ASk+
         VAacfRkEZtr1LJ9afGNmCFSrGnDoqgBmXeiSmjr+MDsvYEQOjp+ster51m283d2eyirB
         CxzROTugS8GTWLF2wREoC33v/o7uaWxjVVQ7HHgUGp8H3sUL8Aph2naXJNDGTFFNCGmu
         L/AhjQPV4hmrJ4zhy5puQzKVSgD/w01Q/Mx7lUGzKyEQw2G5JTb7Yk7tA5dlOhbRDV9x
         lWHw==
X-Forwarded-Encrypted: i=1; AJvYcCW0EMhz/I0o498ih/R9KP8E0QuMv/qAF4hRkRAWFYe20MSbKtuHIlsM+D54BDvR47Pw53Uf3mq+oPrjOlgKEWm+ORS7+Nb5wZcr5GRvtXPMczM=
X-Gm-Message-State: AOJu0Yw8eKQccWb6RurLi+4CsxHJF1Shbwc4QM+QqgnPhgxm31bq51+P
	MHn+7YlJm9HUZ1Il77BpXBhz4gGwfxmpyfiC0gvif09xUkATqqHpoZI3/IyNJwo=
X-Google-Smtp-Source: AGHT+IGTBQXFQxIW1xR6WblG6hAs+BpiQfKPcE7mNs9Z7PfdBbyqjaLnHEWt+TEVaqWG2aU8UWq6IQ==
X-Received: by 2002:aa7:d60f:0:b0:565:4bce:db2 with SMTP id c15-20020aa7d60f000000b005654bce0db2mr13728edr.40.1708592143835;
        Thu, 22 Feb 2024 00:55:43 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7dcd6000000b00563918a48cfsm5325808edu.40.2024.02.22.00.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 00:55:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <263d6626fd4fa51b175b5c7a53e6a363e2c91519.1708354280.git.geert+renesas@glider.be>
References: <263d6626fd4fa51b175b5c7a53e6a363e2c91519.1708354280.git.geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: memory: renesas,rpc-if: Document R-Car
 V4M support
Message-Id: <170859214253.12531.12753169435670805395.b4-ty@linaro.org>
Date: Thu, 22 Feb 2024 09:55:42 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 19 Feb 2024 15:52:19 +0100, Geert Uytterhoeven wrote:
> Document support for the SPI Multi I/O Bus Controller (RPC-IF) in the
> Renesas R-Car V4M (R8A779H0) SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: memory: renesas,rpc-if: Document R-Car V4M support
      https://git.kernel.org/krzk/linux-mem-ctrl/c/fdb88a1453d212ac52bbacfbaa9a950c626bfd1e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


