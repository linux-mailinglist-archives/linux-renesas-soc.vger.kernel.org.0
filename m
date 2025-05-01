Return-Path: <linux-renesas-soc+bounces-16571-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3B8AA5D32
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 12:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A97FE1B67974
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 10:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F3F21B90B;
	Thu,  1 May 2025 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q8l96JoW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674911E5B62
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746095109; cv=none; b=qCg7UL60UDCT9Qh8cSzYsw/U2Mit6yAsxkU/3WTMAk/QGVTflWMx00EfU3Erh8ilZfJIUtxQijfuW1iIrbA2TCVZwuDXfg/E9/O4arAslcQXSQ5/KFjCtd0AVnRalRu1isFzUNcQbunwwkM1bhZebks7wIzjpwXX+7qECX5J9i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746095109; c=relaxed/simple;
	bh=PR9xWjWtY1iAKruLrZehc5LXzvbiVe0hGpCBiuW/Dmk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iECrw4OpDZ+BSige3+rcU+hKqStlxyamK26Mn1X95S0cXc5q8KG9k2/CwE+TezVXpiCyY7hQHrjTnuIZyGmStWL7x6uw9GMxG3LUH6kVNK7f7JBRw0wcgbmTtv6D78xw4ivGahmtmBeA8uDR6Ffooc1muaatRItOmaK16uHEQYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q8l96JoW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-391295490c8so12541f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 May 2025 03:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746095105; x=1746699905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dryGrvLnz2vL6qLUtXbmc/TqxS4N3KSNk67eocK9ucs=;
        b=q8l96JoWEX2P9E6Pk/yXii18Xo0jJuPj7Pnaj5C1Tf2KE3DaZ4VonqQemC2DpyZ32l
         3nmujl5atgqUndwDBkIYyPIofQfRez0LUZewN0RQsaKalVAC3/tDFP4sEspykO3X5BQB
         4WF0OvaQeTxNq1OlOoqM4X+l/BcxRpo9kIlns1Tsh2Pa9u/Z7tiJL/cSNZZVD+dptAMr
         ktivOE6g9ocT5Ch37C1esFv+mgOdYLuDCKzL2yTkMN14mKj5UbZKcd/eg8fZ7V1lJwCy
         4JQZBpFtMVGk2qAIrBN7L+QPdiFHF6i9sVjmt7ASx8jCD1iZGQQUElWeeeU/dw7qHATu
         VUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746095105; x=1746699905;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dryGrvLnz2vL6qLUtXbmc/TqxS4N3KSNk67eocK9ucs=;
        b=KzpNmIxFc1WCUHyvrytLODe2sHA9TWI3Xs1tXsZwSCB/fmFwXkew8I0AdnrAR+qE96
         pUJjRr+Yt+oJ2rr3etTfCXashRAmjvHiwTmhW4v8SZaR6G64DgGXff5oRSv/AITjn+Sk
         BhGjhp7iTvp1VEPs7CNUlBu2/EFZFwkBtqAQ8KVwD13Dk/MsoM6Yb1UHslwXiDGKK2++
         JAltgyFV0XtJGIS52D5AIau0KD7gGoRXUwXqGwZyQL3PutekixQOQ1rS2cjApqAM14G9
         j0EpS1U/D+otvdFGtEKzvTGpAo4VNi+LcL7e9t86suXgGCk46ANMkRcdG44wkzlr199f
         wvsw==
X-Forwarded-Encrypted: i=1; AJvYcCVwS7YVl8dd5LJRRKAJ45mH2bxt5eWNJWdIpueqbdu1P1bHIcyI2Gf1YZ1sKbx68pjuh70zmaFtqJf+IUsqFI4PLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvVGAeD9r1VO8kbeZolzsn9huyL+hM8mt0GL1luQn6A6cNs+fO
	Tc0pS0OAHS+CnFk4gOzgvtDCA8Skt9o7akvAMPs51rWbiQlAleB0fCGHmLYgfs0=
X-Gm-Gg: ASbGncv/CoBbNuSuIwS+rEvKFKqNwWTd0qe7dAhwdMffXi3LaFRFwC1wfUgbSYfMB+D
	J2JGbf+AWe2Z4dqRAbC5sNSerkjanNxxyAcybAqnXIemI5Rum+Qt00pECogyd3mtFS/agqSgDlK
	A/B1YQvd3wAE/VywL/Jyyg5zDuPjPCNeX2x8sSbd990aXQ4uoWqWimHO9pPdrmZRZej50DzfsoC
	tirNaIVfd9qrs19H0Jgxy2SNgmShr6Rxfqd6Ib8n+PodF2AB95tS9RKFTuPVoBlIbGMncqODRtf
	Gtd4WFL9Mhdj+HO9EzuJweAEnv8mDGZLpYFwE7dA9nApBf1HFr2nOflPZhU=
X-Google-Smtp-Source: AGHT+IFtlAFqdh+8cHhLW2J4dHqUoJqyV24P84AroyywefMEKH9YFk0JjqRJGzf9yHVaZUM+Hz7+JQ==
X-Received: by 2002:a05:6000:1846:b0:39c:30d8:a44 with SMTP id ffacd0b85a97d-3a08ff5c739mr1842942f8f.5.1746095105654;
        Thu, 01 May 2025 03:25:05 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a8f7e8sm460820f8f.100.2025.05.01.03.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 03:25:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Mark Brown <broonie@kernel.org>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250424090000.136804-3-biju.das.jz@bp.renesas.com>
References: <20250424090000.136804-1-biju.das.jz@bp.renesas.com>
 <20250424090000.136804-3-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH v5 2/7] memory: renesas-rpc-if: Move rpc-if
 reg definitions
Message-Id: <174609510454.12307.8023299982684668279.b4-ty@linaro.org>
Date: Thu, 01 May 2025 12:25:04 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 24 Apr 2025 09:59:50 +0100, Biju Das wrote:
> Move rpc-if reg definitions to a header file for the preparation of adding
> support for RZ/G3E XSPI that has different register definitions.
> 
> 

Applied, thanks!

[2/7] memory: renesas-rpc-if: Move rpc-if reg definitions
      https://git.kernel.org/krzk/linux-mem-ctrl/c/228e72bf943687d04bf06a98722ab6cf9d4b8ba6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


