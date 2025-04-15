Return-Path: <linux-renesas-soc+bounces-15966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9305AA893D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 08:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E2371897C3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 06:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269CA274655;
	Tue, 15 Apr 2025 06:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYHuV4Y2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAC22797A0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Apr 2025 06:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744698057; cv=none; b=sRdkJpVuWW2hMq9oasfr8y1ZGk6OvxdUKbmcBlPAnCUQ8gzbkeInn1K8mWXDeT79h02Cf7quLQS5RAFY2ffxvmQSf5bwsgEjoU7rH8Ol0baFlXBzkhY0j+6f5m/+ZcqTULzEepJ+0QxHKdpvrvnOhHhfADWZoWXQHbpOhpRqaSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744698057; c=relaxed/simple;
	bh=ySR9Aad4O2lizyx1aYLpWoQ4Q7D+AHWilizE3uMBfy8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SwD47rxl9tdYyJLz6sWA7dROw+MkZ21Ugb16yCXEXlOL6VJ6OtmliHJln0mZf5MdzZNKVr1XkiqqCryzyhsbvU6+e02KdpE3wmcQF1JBnySidHJLZmXPzukeWOtHL6+tQAHVIALP3HP5ZJeufs1siTO3DxtTPN6nli8l1f4A4tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KYHuV4Y2; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f37f45e819so552577a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Apr 2025 23:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744698054; x=1745302854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64MyDPmK4BBr5JPLQQbBw/1Kju6yszKPXzcQh5sJkao=;
        b=KYHuV4Y2rFmpspmybqvq4cuMcjBxy82ccXK1OVqcLcMOI0e+WfJJNxkvOyd9wVqFo9
         tkxapvoqVKs5wBS4SSoSObWy+ApYvh+RiZy9KaHs95itlk3totG2QNqnn0FsmvPc3EUv
         FbnQVa17GzlqMdf4Tw4JqOvH538RVixGt4COlLDaYHggoP6EaUEUPORK/3odE/EXrhRI
         BrTy2CTHwgsdUdtf97ByaRbPF2nLQokggq3DhlaviROcQ8e/LXowNFSatJk7wyluoiT/
         xNfAf1F4lbFa6TqZgXN3hRAYPIaehCUVq/Y85MLOzOGAIKVj5MbOBGCebncMK2TlAAxx
         xNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744698054; x=1745302854;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64MyDPmK4BBr5JPLQQbBw/1Kju6yszKPXzcQh5sJkao=;
        b=K8cgSyt4VWJmN/9Ikd+W4gbzVsZbmM50roQ9Qdd1pMbGNcORSGVdKs8H3Rys1dVEMf
         x5q2IU3F+qjXp1yKyyBYpeSwCrU3MF0EQvc5h/Rn/7rRRrnyuMJanCzNNFzLUg6GhHVT
         usy1oxWtxxgqYHq/gqitZ/Uoa20n9F+Pc0vTgY2+Th7fRLkq/f0TCMNx5VicsDCn0vVW
         G+OBiEVfRw55pYtpuF6wKrpygz2G65y7q7eoGgzjSs2XyKNa5nivfgpvAgHysNK00WER
         jTsuiuTcTxfly1AtagvplyiDG2gBnIIWQUJ8SP8ohhgTrCKLkVa0SsJiUmWQe5nLaviE
         9wjw==
X-Forwarded-Encrypted: i=1; AJvYcCXRGRxvyCl1jVty67n7bTPps0yCO2iU25rXXTAAhwCgV9J5UqL4boedYIj16FcRj3Z7APh2T6qjhTQjk7f+A4LtlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUud97qNmuRKiasNe9GU3rCieW2SV0mBOdTdusuM6cklJUVeij
	lOLjUCbmzNkBg1Wak79Qk1kqE935cFPLK/t3qownnmwJc21odpXDdjqzEjSaw6Y=
X-Gm-Gg: ASbGncv8Rbxk6d3RI2lhCqaowtb750RkrhTcNDy62YnsKhx2Ry8v6wQ5htnPReHX6fy
	hrXobV4y0FhJVOv3xepgyHflVAyEAWQ6jDshFS3mqC1bA4xEVCY9d7YPHGqWUeTNyB7LBFqnIjH
	y5kRo7ahtnJb4T2CdI7hFNuH2c4FCzOyqXQs8yNtj0NX2XNn626Jn1HfvyLVe5BJAKJYPgPk7oi
	T6Nqtahe+/K7ccA0rcMptu0jg3vBzmYAumOEpgbgRuu+gWWzBjQgIa6/uffMn9Sa/Z8ql34aUqR
	95sKbMsyvnHUwIYMxZdZXtER5hQeQRKUqHolBFohpOiToiaSgd2qJxrOyJlMqUq2Iiz7AyijRz0
	7AUModtO/QRq3tJU=
X-Google-Smtp-Source: AGHT+IEauAREktG0SUftokwarlYt47m5y20W9DeGLAKa0t7PeEy8bBrbXt/lQUc6ywDKfTCg1Bk2zQ==
X-Received: by 2002:a17:906:3104:b0:acb:583:c63a with SMTP id a640c23a62f3a-acb0583d1bfmr142528166b.15.1744698053758;
        Mon, 14 Apr 2025 23:20:53 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4129sm1053861866b.98.2025.04.14.23.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 23:20:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Mark Brown <broonie@kernel.org>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250401143537.224047-3-biju.das.jz@bp.renesas.com>
References: <20250401143537.224047-1-biju.das.jz@bp.renesas.com>
 <20250401143537.224047-3-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH v4 2/9] memory: renesas-rpc-if: Fix
 RPCIF_DRENR_CDB macro error
Message-Id: <174469805169.15476.10498691393625159362.b4-ty@linaro.org>
Date: Tue, 15 Apr 2025 08:20:51 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 01 Apr 2025 15:35:20 +0100, Biju Das wrote:
> Fix the below macro error found while moving the reg definitions
> to renesas-rpc-if-regs.h in the later patch.
> 
> ERROR: Macros with complex values should be enclosed in parentheses
> 
> 

Applied, thanks!

[2/9] memory: renesas-rpc-if: Fix RPCIF_DRENR_CDB macro error
      https://git.kernel.org/krzk/linux-mem-ctrl/c/bf657e234ac12923b579b13d8b9f1b5ca0519697

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


