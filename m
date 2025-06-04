Return-Path: <linux-renesas-soc+bounces-17831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13316ACD8A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 09:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADDE23A19C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 07:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85481F30B2;
	Wed,  4 Jun 2025 07:37:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE3316E863;
	Wed,  4 Jun 2025 07:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749022648; cv=none; b=U5syt3ChM0LIA3Fz2eguGn2ezqRm8o4NFkGf9X5qHCT3jKqlt1dcQgtvO2HWCn6FMLdRmNd8te/rrGc1kvQ70we5hFcH0h1/ae5duEMpjKEVdOaBz2I1mwePhPiurXemnAMv9OUompmvzt8Rg2TrgbLKo40u47H6BwqxfrdSfpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749022648; c=relaxed/simple;
	bh=upjumXGPmZNAyvHebw0jyyXcmM0G7EmKN9SCKd/8/t4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUU51rZNaq9EiTeBNFayKHFaEV9vVokNe5fQ34RBA2RqsgTK0hKf4BdVZq8tacSdSjMKBwzOHYULGlQWVtA/mg4FoyKMc3kX6nixDEOQVulKcRHjhvv/YMcrHnSqKHlzzO9EF4e+duo/9U2C8e7Gpm8ghyFJTgBVdhkqgzEFGZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a42f28017eso8102991cf.0;
        Wed, 04 Jun 2025 00:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749022645; x=1749627445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDFQi6V0qnUh6S9wPFbfIBuG7/kVi9IRpPAeXlCHSAM=;
        b=CR6pcozW6oa3ZITnkBd03iraAj2cveNz62WKql8Ow3gIm4Fqb8i+GTHpIvGaI9weoB
         MnNAWx0WYRh7nBH3CKDiivg+RoAh1gl+nGHC23U9OdD4k6dTt3I79lzo28ZkdWeFBJFq
         KQdEqRtY+7H+x5jzHg2u1reZ6bPuLCG4wtVThWv5jxL14sEiVPQIuqRqr6fnY4ko3khN
         A+c27UbXRal8DlGwBusYQQ4ekxr0GUdZT7euLc9TjscWwL1HeH7LWmYtazu73ld2fcmT
         mUyAVchiOJLIZUriHrQcltGPKGi6XVRgUJjP+eO9uR6WG6wrl87giWIsZr5L8R1Gtkpe
         aUTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9t8tOosOC31kwYuhBaLKRhsYUOrWRwGMWM72cVrGHywJi7vZNwQdZv2zheX1nopij47I39kB5xDV6@vger.kernel.org
X-Gm-Message-State: AOJu0YxeN157RSXOr5/0ZbOp3GpYGt/TwMkWYpL91ZeyHtpEP9nd2s64
	ZnOY3bH+2b/2dC9rruO36OC2QS6DzvgWMMdOumIUDM2wWzSg7LQj/Jc+S5ZNBD0K
X-Gm-Gg: ASbGncvT6s8SBd3sfEgg4B1FbwI7KfwJj/NVB49UwLFHNQtDOWuc95znxyLnWnwo45g
	5vAUVIQDMnZdrcy0UzQVhZFhStfyf6yhnwwlMuPdlLaS92aHW4cn/qrvgLGcvGUvfUK3DumgFJk
	637ncI6LirFt5Q4nTO0XLduPyvzotzMvaezzF2WTxI0CrTB9Q/+MiYpMqsUxEJLX8s/0HyfKzuO
	WMOCREDrKSWARwj/JjtQjclyz1KmY+DmnYBkjvHEZ3R2TB2k+aC4F3Sw4hplWGQPRkg6eZgHQ2o
	0o3MThiItNHRNLd7yh3H/6M+HWwsSIpLcJeV+fXmU3Q8W2GFj0VzUOdzfZe9AZ/XXDXbsnDBniG
	K97i6PsqQfG4pMA==
X-Google-Smtp-Source: AGHT+IGwJC9CHl1OQA42WvANSayBtEIu0JYfbUkKUM7BMydMNvVRgGQ2J7ZPjwPraoCasB6vxH9Omw==
X-Received: by 2002:ac5:c5af:0:b0:530:55f9:acaa with SMTP id 71dfb90a1353d-530ba31cb3bmr3470395e0c.7.1749022633994;
        Wed, 04 Jun 2025 00:37:13 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074bf7525sm10537491e0c.31.2025.06.04.00.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 00:37:13 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e45cfc3a26so519307137.0;
        Wed, 04 Jun 2025 00:37:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXyO2nknv2qZvohYsr2SvdrHn6SiPzmWIvNw3gVbk+OCgWElhdhpilaArMIxidnLEIG0lbbhIZWfvxn@vger.kernel.org
X-Received: by 2002:a05:6102:6852:b0:4e5:8a06:a6a8 with SMTP id
 ada2fe7eead31-4e7360522e8mr3970295137.6.1749022633456; Wed, 04 Jun 2025
 00:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522080112.26050-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250522080112.26050-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Jun 2025 09:37:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbx9_VPPyOTcy12St59=ZJ92gD731De537LfYV8N0K7w@mail.gmail.com>
X-Gm-Features: AX0GCFvfKpwKq5Y-Ujz2UVkkdK1E6N8Vkh9qhPiUIM37bxSLFnQWJPSR_pOHHfY
Message-ID: <CAMuHMdVbx9_VPPyOTcy12St59=ZJ92gD731De537LfYV8N0K7w@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 debug LEDs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 May 2025 at 10:01, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Enable the debug LEDs connected via the I2C GPIO extender.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v3:
> - decided on LED_FUNCTION_DEBUG after discussion with LED maintainers
> - dropped "keep" default since it did not work reliably with the GPIO
>   extender and no bandwidth to debug it
> - rebased to linux-next

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

