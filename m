Return-Path: <linux-renesas-soc+bounces-3772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF2287BA3E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 10:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDB801C2154E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 09:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DAA4D9F9;
	Thu, 14 Mar 2024 09:19:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859F846A2;
	Thu, 14 Mar 2024 09:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710407974; cv=none; b=Tx4uFvWB1yo4RN52q1Zfgz9IeVX82vzxPAhlYNFlv/R57gMv/ZW6JkhjaQnZZQ5vEK75iuwZPQ6KZBqK3yEgin+ES/BnPLF3hWy3/98DsEFANKu+oy96Bo2S6/mqJhAtNJ3I+46/VfEJZco3C6TI4txjTAC1ArfJLbcKjsOKU6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710407974; c=relaxed/simple;
	bh=CfFMPr4y2aZNq/+SP6CzdmyXz/+bljoBIdcpJX8TYd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITtnhHbXRjpz4kPs965f07WnfqEsJg+rhu+HX2peEtZcDIDaBaX691ucta53UPmShpYBjjoGt3n6iwIpjuelf/2b+XKUhWKYYdqiW/voLk74FKwoT7YquozTxZvUeZd4kjmXwBasBTWlgQSvP+L3rzfgclXbuUvPXPebyR+qul8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-db3a09e96daso561015276.3;
        Thu, 14 Mar 2024 02:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710407969; x=1711012769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxIq0wBomc4vZFNHgjazQfrOLpQM63bDuE+s8yKsHuc=;
        b=uxPleeg5YOHJ9P7EkcNcoNRnhPyn38b9Bn1IYCP2iK0QVPlQaMWYz0Gj3Mde2FPWe2
         dsABsZIoHI+PAL4adWty21HeKxApDT9358liI0JF5qDpRNz8wdWddee4v4//GU/5V1SZ
         UNdkdv4A4fI1c8MhBA/dHmKQ7r9Vr6vvseOxgzLPnLuvNhr0TDW0R9eQBLDud1awfrPm
         dmAis5IJ84/RxkxUOiWu72z6w9fikRi8NJoXFNzHLFoHt3NVk6V48pTWJOUDkvDq4inS
         UAzFPbQkmfoj0pl5TFH2HYqPtoOslwg6Nzt+Di6S0I/C4qExsNXr9RarI8Am+7IeK2o4
         sOBw==
X-Forwarded-Encrypted: i=1; AJvYcCUkQhcLh/8HwA9QzI9jDcJpwMgDR9OuXYWfCG/BztxqxMxmXWb2SJPas7I6w4DbC44t55nytU2/m58qNnSmiIYxc7xzImd8tI73K7Cr4sFtqiaxsrIsApQ0i5DdfGeuFXE+E4GwjYn8PC1zxj7s
X-Gm-Message-State: AOJu0Yy8HTDwb2pmEooyNScMs+9Xog9QGbvqvzIhe33VpI1Ib+NTtW/s
	iDDSRWbxMapUc0m8DJn9xLbL8DWG72FcFXHZ0KG9nXnIWeDZYtKGmPUq1UnQIhE=
X-Google-Smtp-Source: AGHT+IH/JOV6QOOR8hxGBlaOdvRjpl7tN8cbquCGzidH5sSNP7gcILMsy/zGAd86EJEf+tWJchnbcg==
X-Received: by 2002:a25:d044:0:b0:dc7:6192:c688 with SMTP id h65-20020a25d044000000b00dc76192c688mr920969ybg.65.1710407969520;
        Thu, 14 Mar 2024 02:19:29 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id d2-20020a254f02000000b00dc25528fe9fsm193069ybb.9.2024.03.14.02.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 02:19:28 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-609f359b7b1so9297957b3.1;
        Thu, 14 Mar 2024 02:19:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIiza5u7qOrKTUMsYCd09GVKBMn1Pk1Pho7rCEafCUCHYfP+Iox1i4ewwFCE4PdsuMxkpN1nABqz8emmMTei/BJE3IDhqJoSTMHqQD5YQQSPiEuKIWz2yKg1rdr38XSOL09F03d+RMe9mff4T9
X-Received: by 2002:a81:ab53:0:b0:607:f785:c5b5 with SMTP id
 d19-20020a81ab53000000b00607f785c5b5mr1060896ywk.22.1710407968467; Thu, 14
 Mar 2024 02:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313181602.156840-1-biju.das.jz@bp.renesas.com> <20240313181602.156840-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240313181602.156840-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 10:19:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVEcSmAyUiV-pNC6DG8UT1oZs23vcCKv84rFhsx_XdFvQ@mail.gmail.com>
Message-ID: <CAMuHMdVEcSmAyUiV-pNC6DG8UT1oZs23vcCKv84rFhsx_XdFvQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas: r9a07g0{43,44,54}: Update
 RZ/G2L family compatible
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 7:16=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> The number of pipe buffers on RZ/G2L family SoCs is 10, whereas on RZ/A2M
> it is 16. Replace 'renesas,rza2m-usbhs->renesas,rzg2l-usbhs' as family So=
C
> compatible to handle this difference and use the SoC specific compatible
> in driver to avoid the ABI breakage with older DTB.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit description about ABI breakage.
>  * Updated commit header as it is RZ/G2L specific.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As the DTS update has a hard dependency on the driver fix, it has to
be postponed until the driver fix has reached mainline.  Hence I think
it makes sense to apply the DTS update together with the driver fix.

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

