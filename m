Return-Path: <linux-renesas-soc+bounces-11165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 986E69EB539
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 16:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FAD4283F81
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 15:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559581BBBFC;
	Tue, 10 Dec 2024 15:41:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69561BAED6;
	Tue, 10 Dec 2024 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733845284; cv=none; b=mO6nlQfU+JJq0RV9qRcIjbKykuOr175vD2lHDlZNcjOLC39HOZte3PT7JqIbIMW28/EeZ7L+HlUTl65gNWOlAMM30/toudsbxrrtrBrZ7vTErcjkXpUTAo8eTAIesnpKVp41wOyeOp/fled41KZzLGir7obGnefyorlRh8a5llc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733845284; c=relaxed/simple;
	bh=WGwOVXaxls9oMKmze/z9Q7IPNLkiCz+IAvZIRyXwimM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=drHrz+faeG+Hu3EwC2jk/22gASNtVQMKe8OiN5Lf6hIDRzReviKvT+3k76D4BcNFFa6d8doLh+BDoyFwav/2ZoWfuGmSc/U9Aeb8clyI0K/6a/KhrclIFG0RHZ+qP7K5QV61PmCBpo1Ud+jS8+Od/HrCYc1inafEgAoeZMOhoNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85b83479f45so1101595241.0;
        Tue, 10 Dec 2024 07:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733845280; x=1734450080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiU6dol6+4XO9aWJR+hvjMjVBST+e1yHPKcE/OhwbvU=;
        b=bfskcUpIjom0s55X7dHRRnrz/O3IMmKqz23FKIhgY6gduMA3FtycW5ybymsVsuEhMD
         FgVNXiw94zVG+GAYzGUdiy4buvcKKV3AkgNFQwxi470FCu9kwGGuM9n8stnRsZaou4JT
         cVPXE+4Bh6CuZQQayR7DIi0BZ5qSAbWDOH3R11SNAo4LVWqkqaby+BBQw0AOvOZOCWde
         SXkmA+omOR1Hf9tYuQuxiToEje5pYUssej5KJpgkPbnNjKGdBcHB9Pi7cKhTPmUEqaCK
         VpUl9h3SavTBEQuL0s4gSYbbydCa+uii6eRPXuO56m9vvekS4Kmv43bx/OhvI/ghfPZi
         AJUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGyR4tLdhyGuxRnVktdJKULB+dpDN7O24QoCnlsfZktCkUN+RDf6dQW2U+rR+oBLJZy5l5eHkoLYDT@vger.kernel.org, AJvYcCW78c1JMnRPdTyiN0CH7Y5Z0GL1DUbScu+CvZhPbdmffa+rF33e9VgY9+5wksHVwLnLsTBRgKL1loj9@vger.kernel.org, AJvYcCWN13OfixtCfAvw3zNeUXHtgJnbhVkxSwNzrZxB7EScjw8ROJVEdy6ieXVjUof4ljXpVOYnzYCkIuoXsRZkgq1Rw1g=@vger.kernel.org, AJvYcCXtNtQOq3zIQ0saSLad9JJNfRPlkfnzYwD2GOmkofHmOUhXQ6R+De1CsYNS9NTS/E0jQrIo4Qyjr9Hw5r1O@vger.kernel.org
X-Gm-Message-State: AOJu0YxHrNkp2neh0aRsS0YZtn0iJo3+GXRYL6qLEHE0Kr/61F4Ty7f4
	1lYGXRMRi3dYvOXz3otzXabdDNq5r7A9qrRJC1TJh1dTSw5qWbSEM1LBP5V4
X-Gm-Gg: ASbGncvaYvJ6bSNQ417BanRurv51HIhiMqob++4A8puzNkJ0CYKBhDfZRSwQAFkx5eC
	U4PrLh3gyjU5pB6N6nOe4RaDvFyYz2pa2VNApkO+TeXImlp01Ayqny4EJkyBl8UK8nn3OdAIrKZ
	YxezSDkqziF6HRHQo4sFAjqOuvAbsFWaZudb10yfl2x2Akl8+jbQWWUNUMIrh+XFkkIty2PXbj6
	2b0vzzgsdLXcJTUdXTcb2ua3jrIMEH6PiJi6vm5bo+mKwqOC9TJ1GScf1QYCfj77+jPcpGpI+Dl
	wD5fAJlruvdTExub
X-Google-Smtp-Source: AGHT+IH4JO2irsPj8it2M4hKY3TSjZf9qQs+vHE597KV57HHN+SokDqdYYIUizbPzBnR15DEbA6hRw==
X-Received: by 2002:a05:6122:30a1:b0:516:1b30:8797 with SMTP id 71dfb90a1353d-5161b308baemr9580292e0c.11.1733845278419;
        Tue, 10 Dec 2024 07:41:18 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5160abcdc9csm670869e0c.10.2024.12.10.07.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 07:41:17 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afdfefc6c1so932103137.0;
        Tue, 10 Dec 2024 07:41:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULQBUXt4AAkfKT+J+gbgEt+IczVoiqtn27sYWQFW4pc25s9edJV398zqauz+HM5+roy7K9UeCee+uliaORW2UKfwM=@vger.kernel.org, AJvYcCVCePdZqqroW7EjeVFl1lM7LsKnxRVNlLRmFFMreY0uGPj8X+llc+pzvZkTPsKqlv/moLIc2mStzSHlwmNN@vger.kernel.org, AJvYcCWQIIePpTSF2ETxYNsIKAgGBesAF8uaPhL+r9A4ILRg5YFoQkfQI7cruw0f4/ACpbY6A+McZZSP+Y9i@vger.kernel.org, AJvYcCXLQ+DuSsD2yj4L1Evz5w/+VjKXzhIIHg3khjgAcII6LHX1ifYJ9ID4IXbkll15iOPlXULEWZLUUHCE@vger.kernel.org
X-Received: by 2002:a05:6102:5494:b0:4b1:14f3:5d6d with SMTP id
 ada2fe7eead31-4b114f36884mr5547677137.6.1733845277603; Tue, 10 Dec 2024
 07:41:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com> <20241126092050.1825607-16-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-16-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 16:41:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUAXG9yLq0L-w7LOaURfPXVka+Bwt9oGoNVS_PJcd+aEw@mail.gmail.com>
Message-ID: <CAMuHMdUAXG9yLq0L-w7LOaURfPXVka+Bwt9oGoNVS_PJcd+aEw@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] arm64: dts: renesas: rzg3s-smarc: Enable USB support
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
> Enable USB support (host, device, USB PHYs).
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - this was patch 15/16 in v1:
> - dropped sysc enablement as it is now done in SoC dtsi file

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

