Return-Path: <linux-renesas-soc+bounces-14083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDD8A54D8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 15:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 582781893DC2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 14:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B661624ED;
	Thu,  6 Mar 2025 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nrfZaU4I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A591624DB
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Mar 2025 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741270941; cv=none; b=czlWJpJ692SX7jIzY04I4wAdI9Mt3LDcIp8QSr9fByckTmJ5VW9xVeiSHM8Kmf7vfOYm3EnIDU2smHU6avY8ppnBZ7g5y16cIxE3bNlA7UOvQ5uUXh1vujfyedV3WtNykVGTtYMYbHPL7/hVs9wplpCtQdg2bdET4XPKwO+DP9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741270941; c=relaxed/simple;
	bh=VFbNjEz2+/wlUB7vGFfTzUXZhcULzXWdvo9/ByZBeMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tq/Vr2wpqqfdb2VbOwS4p5KItLQLaOEuezT3Qx765Co3hSk1roWMxNt7NkUAvm32dYilrpwIA6Izl8fXStgbFJLggHBUzWc4WguRM2krsQ6BDCNlaqIAvxFixo4YjCgZVqUtpJ7AI0tZx5a4tSHWueD06PdxxiV7TqdJ32SyniM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nrfZaU4I; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso222058f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Mar 2025 06:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741270938; x=1741875738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxWPSzHzc/Gn35u8MiTD5Axzok0afEcoR/THf4/r/lU=;
        b=nrfZaU4IkHjsa3NAaXfdf0UPDhMBHJVIxY2nfxvfAZrHgcCkWVuJDZV7nFJ1KVtmgE
         3MsE/btBochEru7zx8e1OLUjnJ685A1F3PvocidmbRqwGjvNF76rG1lQdujpsBn+MRqD
         lMc+3wK4hyPcUInz7qzt3JbfTAkMgvavWvI629Trhtsq7BwspSdHLS0k4JJoE7vR/aIP
         JuxWTXvGjAUyeyzwIPmzElSQwWjxMb0+SXZ9rsn3SfsOqVUIG8h0xFLx4nBzyPZRmyj4
         ZPzdqybnpv6eQZxCtOJuvxpFj2lAbS7Daha2jftQII1LL06CkInfmjm2xSXJp/iOBd4v
         wAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741270938; x=1741875738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxWPSzHzc/Gn35u8MiTD5Axzok0afEcoR/THf4/r/lU=;
        b=Cbqc+IPz/4goghrLwzy+8SNccryLVqiAzIareM5pTuHTFAXilM/91w1ULKx66bOLET
         aI9fGVW4JrD0ccc6zViDDcajTcim1Uf8NuoaTDm67FEzH+Z7mWT5VtD8kC+NzkyBk19Q
         3zfI3aLwLJqWavINzI+1rOjmQO7GbeEVFhWc0KlIzWqWCF75BbiJLzdeKQoJZnFo70CO
         NybT70kkENyTjSwQx8UR2s4OVT88LnFlzGvlSMrJxLaQBNYD4RD2w8bALaD19z/VfAoq
         zfJLQ1/EOMKS13CMOxUsQzFXa6MGD5lv/eFqgm/nTMWH2JjXkQWS9jaEympUAbLmaFXS
         3zAw==
X-Forwarded-Encrypted: i=1; AJvYcCVlK3GA103050PPsQrThkpQzIk6Ge5GG/LDztJoNJ+p+TWJw1VTzGfrcOP7nfo9eyNnOnR/RNu6nJjZkzZvgjEBIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJU+u100pn6DdQqzH9sta9p6LXMJCVPedAzzjnecLNzu/idfBK
	JakOzTYBn3PlV1w5VM4xrbiS2JBxXBI3evYeustmLOxsGmadTeTDpPHM5xJDEjU=
X-Gm-Gg: ASbGncsmH3cR/vhQDNaIQ5/2mUUSHxJ2n2HuJ9z2YfdiJQL6atQJlyiz7gdGfq5ldXJ
	vCJNBS+Sr/DSz8UxatisingWRkmNy/R1sESisoLD/0EXgmBU0ZdJ7iGBbUmIywyf6Uo8OzQ2e6u
	zNgStv2QQdDhX/aet6cXuE5yDhDTEbR5stiVtq4rAF16QwEWxvKjoSV+fXjIKGoJvlPVcjdhjLD
	9WizfhgS/rIIleFmYoVeEdUy2sZ0XRojm6ICaKyjCVrn0RqvtibaE9muX6luSbrwMYYYr48pVQn
	DFSQFI+X1uCT+SGTvIvMnh4a3wkIaoz1xLE1iqjIpck=
X-Google-Smtp-Source: AGHT+IFChfeAEV2PHdYq8EIIGSzRRpBIfJ68YMIUl/Po8biGKN3BXhslg6JIN0LNeFsPkfFqsFEoHw==
X-Received: by 2002:a05:6000:1f84:b0:390:e535:8740 with SMTP id ffacd0b85a97d-391297dc61dmr2919324f8f.14.1741270937604;
        Thu, 06 Mar 2025 06:22:17 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ce13:b3e4:d0d:c6a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd426c01bsm52206175e9.2.2025.03.06.06.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 06:22:17 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Simon Horman <horms+renesas@verge.net.au>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] Fix missing of_node_put() calls
Date: Thu,  6 Mar 2025 15:22:15 +0100
Message-ID: <174127093376.41843.17930645720992126922.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250305163753.34913-1-fabrizio.castro.jz@renesas.com>
References: <20250305163753.34913-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 05 Mar 2025 16:37:49 +0000, Fabrizio Castro wrote:
> This series is to fix a missing call to of_node_put() from
> some of Renesas pinctrl/gpio drivers.
> 
> Cheers,
> Fab
> 
> Fabrizio Castro (4):
>   gpio: rcar: Fix missing of_node_put() call
>   pinctrl: renesas: rzg2l: Fix missing of_node_put() call
>   pinctrl: renesas: rzv2m: Fix missing of_node_put() call
>   pinctrl: renesas: rza2: Fix missing of_node_put() call
> 
> [...]

Applied, thanks!

[1/4] gpio: rcar: Fix missing of_node_put() call
      commit: f5aae815b5f7e79460a724af4debfc9abcac0cc3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

