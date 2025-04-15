Return-Path: <linux-renesas-soc+bounces-15967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC27A893DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 08:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BC5A3B6305
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 06:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613A42750F1;
	Tue, 15 Apr 2025 06:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jtx/Otkt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AFF2798E5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Apr 2025 06:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744698059; cv=none; b=J0l5VvoEQq7qAyNjLC1aSkECA2mGhVCUEoc1VSY26K+otPbqcOZ1FHj4QvbHQLx3ICarnaI2lOuEy2OBcCfjZ2OcIoCtwC5y1kfQklHMWWUPU6Z8vmRqsOfHcWx+Yxk8U5dMervxBwHkozYp0LEL1wcrBgklhGV1bWKB9iKEyqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744698059; c=relaxed/simple;
	bh=2NU0xJDUvEZkclJ6rT2MWjtA4p9OKy0MOMsaDqggbU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tLTnIrtbaCcKhI2VzV//WG3HitQKXgeop4cBbSpLi8yXF8dXihbvhf1+VZodSjnjID535pqT62322VBKpbFkSMgvTMfUe1vmKpe/+G+BUJYDUBslXAjXjANoJ3ArlA+haDbSFKWjU0gDl8/2W2GkuCY7XAFXlZ44GLUo5s6cCi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jtx/Otkt; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac79fa6e1c2so82566066b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Apr 2025 23:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744698055; x=1745302855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX14MUykxDUIrJj8RdjSnqrAVA7Z1RYtZYmIC6oLdgU=;
        b=Jtx/Otktk7gduLrzP9ZeNUppzuqnOGqmMseepZ2fgR9iNQUlvcFKVtC3tuRPg/tCK1
         GF9THk+/HV0VlTBAIXBc7i+VSPxg4CoDSGD+tNI03hFhTwMSaSKIMI2+/vRFQyXi90cj
         ufeM6zjxHHIMVvYyovllSW38AI8lCbrwP4swgaNWZERUxfZ4a5n5lu2LCEvDkrOan2Sv
         CKyP+z9yFeHk+dl8g2KomXAPhJzMt7m0HVxfA67YGsSDNK1KiilmqdUPDROpc7AQgUu3
         NYe1HyqRfXAY93e+cLLAL4xj2MlLPQ2pKRi6rijkOsqz1rYiIFE7kVmPxgzPLPipj3i5
         +jGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744698055; x=1745302855;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aX14MUykxDUIrJj8RdjSnqrAVA7Z1RYtZYmIC6oLdgU=;
        b=LX6XaaOkj4rI8kJZ4xs1VnignaGZ7lvBlBKc9a5WR5Vj/mxYsewji4whROAlQwllrn
         FOdvw7BOoJp4QTeMDO22ju5mR7Rny5ZmPsaPKx8H7TScnXUtfbDWb1gvb55lALUBC2nZ
         F88XAp26rvhuVV181+hNcMYl8XYx+5ea2H0LXYmt0LgQeCfhqKmDG1qRbCGRfqb3l4kc
         8VcdXtTznk4cQXBYYGA2fAeqMoG/PFwl5g2rd2/gyDrTshy5KDi04LIIev6mub6GAvlM
         pU2Fi2RH3GHI138r07RTdi3EplWDSqbuUorffhREc7LDwt/t/FJVY7E5glyW9Ga4r4zE
         7Axw==
X-Forwarded-Encrypted: i=1; AJvYcCUl3HRxWwG3AtMRmk9TwfM4Dx65pWEqyf/dBKNcMic6pMuGy/mvAgU0Nl9IduuYVhJpXudDsDTUzmcfUCrh3GPRmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoNzfqk26aCsHQ0cXKTeEsdJ3mxh6HJ/SqtBQefwSbWdY/OvjI
	PyCLCq3LcC6Vgp0arRpF8VxayiPxOXRsIOJGFlBMaDDV9imwEA+W8WclKizbNRM=
X-Gm-Gg: ASbGncsTY6Sr1mbwnvv5viMemTnprjeOpYUhHr/FuzAesBrQ/7tg+fuDpU2HDmZEias
	r1DFSP0+v1FGP+OPXgWp+DbfXT9fgNk43bNrFLabT+UowLse+CgLFL8QSOQ+Irvz4/J7ndk7Kv2
	qOEowamZ6CekJHs+SkmYLpupeH4G249/KPZ4+Y4BQ74J0oCzK06BzqKlrV+P/sqa5fRIP04NLqq
	AYZhN2J/6CCEjTgw7Lpd381amkKDPA3x4uycgUb33YOMBV3/bD+gk1LxZ+GXI06Byg8q7wK2bJG
	cAwg80HyMxlaKtXeCsmP/SI1yCVC+M9X9Bs/Q5bAIhTzg9l73tApo1NJVnVRZxG+Koj5Qhqxyo1
	Bw1R4s7rMQCIFA8A=
X-Google-Smtp-Source: AGHT+IHRmACryoobyc1049LMYBoaFhnOlxm7dQ0Jo7hUhkCjRaee2VhYkVpQQLezbOGGYlgKr6/PbA==
X-Received: by 2002:a17:907:db08:b0:ac1:d84d:72cd with SMTP id a640c23a62f3a-acad34469e9mr454777066b.3.1744698054995;
        Mon, 14 Apr 2025 23:20:54 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4129sm1053861866b.98.2025.04.14.23.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 23:20:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Mark Brown <broonie@kernel.org>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250401143537.224047-6-biju.das.jz@bp.renesas.com>
References: <20250401143537.224047-1-biju.das.jz@bp.renesas.com>
 <20250401143537.224047-6-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH v4 5/9] memory: renesas-rpc-if: Move
 rpcif_info definitions near to the user
Message-Id: <174469805387.15476.3800843952725926129.b4-ty@linaro.org>
Date: Tue, 15 Apr 2025 08:20:53 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 01 Apr 2025 15:35:23 +0100, Biju Das wrote:
> Move rpcif_info definitions near to the user.
> 
> 

Applied, thanks!

[5/9] memory: renesas-rpc-if: Move rpcif_info definitions near to the user
      https://git.kernel.org/krzk/linux-mem-ctrl/c/74c35c84f2ba942e7a7744658a8257d0b3188ac2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


