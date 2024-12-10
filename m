Return-Path: <linux-renesas-soc+bounces-11155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0389EB3A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 15:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5928316346F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 14:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F881B0F12;
	Tue, 10 Dec 2024 14:41:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F401A2C0B;
	Tue, 10 Dec 2024 14:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841695; cv=none; b=qNdgtqZY28qgRvZDrjT6O5+ATnMAPxliMd164VOuV8Pmd9GOi8uAeOYFAiCF8lhGrq9PStsWzprbXFKoQDv/fYvRxPGDpYyW+ntplTTES8ftVKxGn5B5zDXpdIdolDafF7TlKFD9/F0mp4i+YoGQeoPj7FjbXZwHcjtMk2lGAQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841695; c=relaxed/simple;
	bh=Zzv+t0dImOXdQSdL45Rvawv7Q8Cp4z/FkDvT60wGBbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WAuDZpCJMCVnZk4fFpOBNbMUKAJd5JuETUoDIHvAEffG38dYlpbfk2RYEaly+4LaFxHRKEGC6JqRzKdFkq1FHDgXvfxGkBSESpf3u7XF5KmpRO/El3Or/mTszvr+jBAW6vb558Sy350jUIGB5HYlP1sOkZD54iJvtnpX4Tj17T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5174d53437eso1006460e0c.2;
        Tue, 10 Dec 2024 06:41:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841689; x=1734446489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLAgH8um3jpFXawSgnIkqC6rHy/Yka70/RZHFuxa5HY=;
        b=iddtD2IC4zqD1IADRgbvp7aeqOvOIt2Sw/yvgi5v9f4iZhdk4SI7b0QaZsMWArKZ1C
         oZRUpmqc/k/tHKZsh4V0faUTrUzLkzxV07Uuk0/7Zeau8Rgp+2rvIPFBUKtycBc6IB/L
         BjxNnTSCfeIBAS/ve0OpPdHMjvSuTiBensTENuRo1dFMfqclsIaIFvzvBtsMTfCDstWd
         pjBGM8ikfYiuqGR2grOZoZn9G/pFiJKqm2qw6qcmErOeyWXXDGLQG1I7oo9wjwX/MYlZ
         UPXUg9VP3m7CwI236udscm+rCFo8GkuSaqm4OUIoVuLSaLR4xqaXBQ+yWKdcKMTf60lz
         XVGw==
X-Forwarded-Encrypted: i=1; AJvYcCVRhHkMw3Ipp/uh9yhNTM98W5YfUvn1zBuszNNDoVq4CIoRcz888vM4xPLBW486EU8UpItu7WTBHxBS@vger.kernel.org, AJvYcCWzGes/C5aC6ceRe+Zs5HRwLJETKXKeB4IOpM9gkuoOG82S6Fu9sAKrDoOvRlj9uBIA6+hqdO2lPS6vySWvUFb3JeU=@vger.kernel.org, AJvYcCXY20TmIY+fmqcOxZ86UA07QZplMX5rPtfvAkIEkhMYaOmv/Zotw64llvD/y5DD75p6RPGYJCIW1TOy@vger.kernel.org, AJvYcCXosFW2WQeafF4/C3y/RQKlVzDrp1Oxr5a1ZoOwX54Vr7uOiLDto3OrxtDMR4aabsnjgRdpwSKSV71S2n4f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6rMuXeeTyoHKh+ZXqw9MyOiJa6Y8bWtaYI1VPYZHSRprkP1jf
	EObJKc7S3Z7CF8FNwpKQ1Rm9XrosH0Ul0Hw4pOdl+m4ORDCXnG1CBTgNeKxE
X-Gm-Gg: ASbGncvtV9DQTkGI69W5QNpPvO1JSOK1G3cHH6Sd83TJrVv1XeP+TjhK9MmyFO/We/Y
	KHRYX9uoXgL8/RbOhNraRrcWsPOBPjudkwL2TsETEWmMd+nINPslzOE2Yy1cjYTsYyi8PvLwChE
	MNjitrfJy+kNOKS1E/OyeF1Ik1uW20KCuJVUniXILODdxH+Z/3OjejWIy5aHwpG12UGpzmTPikR
	+iU4Nm7Wpy7Pn1LitigduGVhu72mTM9exI6gE4xnqK7lkNIp0Jnh0EsrK6X7mE59bmVLdXfkPdB
	6Mq7hKKdlIcrtOO6
X-Google-Smtp-Source: AGHT+IHxdI4ZYDhO7pvI05bOJaKkKR1EDSgHZv8EDA4zKo/FnFFbQc3N0DRfodrV+X6EKMNwmqKnvg==
X-Received: by 2002:a05:6122:8b08:b0:50d:3ec1:1534 with SMTP id 71dfb90a1353d-515fcae9e39mr14251390e0c.7.1733841689672;
        Tue, 10 Dec 2024 06:41:29 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5168270bbcasm418274e0c.7.2024.12.10.06.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 06:41:28 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afeccfeda2so1153139137.1;
        Tue, 10 Dec 2024 06:41:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2/eAPxjZ6JyKESNlH8swNA5sYQyR48pSAjK+vXTFshv4BSKj4eieBG4OUFIk+zl7StH6DoRsl+3nO@vger.kernel.org, AJvYcCX2IfqPKDbGLxydooAfwo4LNv5KKeXcQscf3Gg7vqGgNc1sFlF3jhflyw33ZeCr1ir1gEUx71neyWYSrTZ/@vger.kernel.org, AJvYcCXQ4/NKRXo+HH4pXI37Isviy3x4EVn9Mxjy/oDg4awR7ihI4TqQS2//1AC0ifAQq2WxRgwbAjtgF/bX201THJHJHUY=@vger.kernel.org, AJvYcCXp50L1vybO6fL5nZtr9e04p4D3fI1bZo5NJQzCujnyOecXOG2vk0jp/FoPdB5qnUS7Qbj17+O1KZEV@vger.kernel.org
X-Received: by 2002:a05:6102:54a6:b0:4af:a216:c0e1 with SMTP id
 ada2fe7eead31-4afca73d06dmr17641388137.0.1733841688498; Tue, 10 Dec 2024
 06:41:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com> <20241126092050.1825607-8-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-8-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 15:41:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU-e-Dd+it+wgXdDpbUEuRkar2qeCPVvvp7ggg1HfPpRg@mail.gmail.com>
Message-ID: <CAMuHMdU-e-Dd+it+wgXdDpbUEuRkar2qeCPVvvp7ggg1HfPpRg@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] dt-bindings: phy: renesas,usb2-phy: Mark resets
 as required for RZ/G3S
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be, 
	magnus.damm@gmail.com, gregkh@linuxfoundation.org, 
	yoshihiro.shimoda.uh@renesas.com, christophe.jaillet@wanadoo.fr, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-usb@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The reset lines are mandatory for the Renesas RZ/G3S platform and must be
> explicitly defined in device tree.
>
> Fixes: f3c849855114 ("dt-bindings: phy: renesas,usb2-phy: Document RZ/G3S=
 phy bindings")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

