Return-Path: <linux-renesas-soc+bounces-20711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 662A6B2C622
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 15:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D045F7BC40E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 13:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52ED2EB868;
	Tue, 19 Aug 2025 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bVh3bz+u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDAB311C3B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 13:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755611442; cv=none; b=TIORtpT1XKwOiHMwWbilUfS/HTOP0l23u4O5dIUEuGKCj7NNCyEcpTHkl0Iq/MTM2CCvg4fwXS6bPujypXt5XCgAZcUH80fP5dJGzYby2qqGfHcVkF5nsqbo4ZpWTgO6xaqhbRje527vWieXQ8jfe5OhqF2Pk8PPsEzhzj+Ab1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755611442; c=relaxed/simple;
	bh=4FLK4uwd9XdTQFJsLCjn7vRojAV/LnaXAkG7LhXSXzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OC3SU27ajYaBJWyl3qIw4xj8mSjwcPCFBrt5KV0/tmGstJFOr1VPPec4B7SOijnT/+DuBIHJ5GoqhXdsm+ZLZCHlY/DKtIbm1mMuXmFSjpHFEivGc1c1JxFArW8SS7xcCrLGHqeFYJ4AS7lFxZe3bxeWKsysdrEx4crY6CeSWuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bVh3bz+u; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so27425085e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 06:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755611439; x=1756216239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDSkE7U9Qu4I+xfKyU0ZKG/iraqseXuPT2xyK2sdU+M=;
        b=bVh3bz+u5fPXs7gV06n1Sp7bll/5JSo6QB7YdaAn0FpW+GsXETkgPGA/2eda3oQJVo
         0YmpR2RyrIHB86nbfwHV44GCTmueBBau/cB0Ah5RCIxMdx35a4igGMUiryiLJF0w91Yh
         ONm39a3joRxaAnL8nXsRBcKV89thMknocVQBuo+1crP04FGY8KDMXq1jfE6N44FszoSJ
         DXpvtO7Sce2SvV4l9bxwUKzF/A4NumK1DVaYLDSsUwSdzqMKBis/6HsCSvMqSCnbpcer
         LVkfYWuWGev5V+2kX8GzE7UxjMbtbqlCg6Mi0Xlk4J+DZEDJOiwlYwhPHIBFmHb+tcR6
         unQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755611439; x=1756216239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDSkE7U9Qu4I+xfKyU0ZKG/iraqseXuPT2xyK2sdU+M=;
        b=nO+KDcBIOI9L1UbLthrkGfIuqUqRfewezDg5PMA17+mOG7Wa/WOxnJF84rb+HInRYi
         HpYHBx4oxAUMAFiRRARCslXTgUMzTcDUqyjo/l1ZdIXgV/FkPmfqkHySzKoxL+4y39Vg
         Wp9fcG4Z3EoDLAvWK5NtOaakebBgRkID6DUUsS+79q1xIdNIU2eWexAfyYj+J88lsfos
         lGH2qzqA1WBukj/+IIsD7ZqU+fbAG780tDkqzRJPa6Vt9Sj2XWkjWK8iZ5ZkrXDh7Jq2
         Yg5Qv2X6fIWj1KY0kdDEPcujqE2PA4ACXEvBeRDmF8refeyXftVvQqwGPBCrz9pbVuPo
         BrvA==
X-Forwarded-Encrypted: i=1; AJvYcCVPTYdR5Eg7+WZGWtswPqlaYaAzd1RV9RCf7J6VwR5fy1UYKGmCU4euNuTMVSdtAES225r77BDDUAhBZJQZgMFjNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypKo/vqe7bbX5O4SPrP7ONIbevU8j3D08BGs669E5ffc+q/pzQ
	dDeHQMBd0Tjkg316oOLiJv4WdDFRjRAe0gr6FzBmOnJtSK94v9rRROxIxDi2dEV4JLI=
X-Gm-Gg: ASbGncuvpw6VSF6+p4Ts3eRGRdHhYgQ0rUuqGFjuHsHrtYHesGTBqjOjbYD+Dd438sC
	RviaaHIJQhnzD3SfQQnfNSl4JFFsulYr34HqYAJdGHfyjiHCgIuS4DYVhO4wUD94HqOeVqfFza9
	NzywGso868HGX5pisFEGy9IcM1KFhr/KxVgknDPAodpEEB7fmXn9FMiX3TO85dHMrqCqIGBeflt
	heM9gmgaj1qrqtkcd/hqXhwiBYxzYKmNyJeZryjP57D7KSXBoN3G4bh/c4rgjxI3owzssGpc5QF
	Kmh8sLmCUkWN3HSRyriaWFFbeQ/koI2w35kJ+B0cFkxC3wJlvx6phYtaKRUb+5Zx+eLQJE3c1g5
	TmiOU9ZAeKjfOJ54ji9NcwLUFTu+lVA7c1YjtLc1d+cIltSrGmryijzJtzq6YuW4FdV27cUnk4G
	OEIw==
X-Google-Smtp-Source: AGHT+IHX13y9qpR1ov+G1SAxA5zb/tzK+QDekRax5d5YMmmYIt2QlNFE9FY4s/8+jyJkR7c3tds4tw==
X-Received: by 2002:a05:600c:8b5b:b0:456:fc1:c26d with SMTP id 5b1f17b1804b1-45b46854158mr6209225e9.2.1755611438859;
        Tue, 19 Aug 2025 06:50:38 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:620a:8b00:75e2:191e:43ad:ebe1? ([2a02:2f04:620a:8b00:75e2:191e:43ad:ebe1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c61a66esm214297945e9.0.2025.08.19.06.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 06:50:38 -0700 (PDT)
Message-ID: <6322a45a-c1bf-41aa-b2c6-f169a61e3a41@tuxon.dev>
Date: Tue, 19 Aug 2025 16:50:36 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add suspend/resume support for
 Schmitt control registers
To: Biju <biju.das.au@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250819084022.20512-1-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20250819084022.20512-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 8/19/25 11:40, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The Renesas RZ/G3E supports a power-saving mode where power to most of
> the SoC components is lost, including the PIN controller.  Save and
> restore the Schmitt control register contents to ensure the
> functionality is preserved after a suspend/resume cycle.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

