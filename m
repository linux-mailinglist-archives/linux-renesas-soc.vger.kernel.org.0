Return-Path: <linux-renesas-soc+bounces-3768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 550A687B9EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 10:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9017C1C2268B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 09:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EDE6BFA3;
	Thu, 14 Mar 2024 09:00:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167586BB5D;
	Thu, 14 Mar 2024 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710406811; cv=none; b=Fl06x6sG2oasXmNwqXxK26yOtCieYBaSCwMEvL1VHRp2fkmnwDcDLI/5Ptpl34x8fyrlC6KMIC0a0sJn6iwRPLwy7XouW83YjrgKsC6aGVBpEz5a4OjyeYGmc50b3s5dGJI6PwyE2HwrZocS5f/9tCO8RDDx2eEZDBqfAFxKgPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710406811; c=relaxed/simple;
	bh=wWNgQRUvkK9MTUs5Kk4ts9b8Fi+6ZczpdI/RP3Xgg/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIiWbqoE830duUG/KeHbS0Nrry0XcZHC+N0axIowt+/Q5WdbtWfbZqy8fjq5WS+ZSX0yebP9w36p/HDCloDpKhQ2gDnwrQ4Hg6Hze+ysCJsp/7mFqxheS60b6zJx1BGVXS9F9kaQQLThDB6o4hov43/l7Yz8ziqb7Clm0d+px3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-60a434ea806so8184907b3.3;
        Thu, 14 Mar 2024 02:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710406809; x=1711011609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEABEMDokfrAOg1stpzpwp/A5lYF9OZcDSPLypcKwyg=;
        b=vJcLKUwqM1DgSNHUdAF/tov5DHZAIfMvj0IxLvt5P1AbbGx00jdatwOTpPoPBYRrYu
         VxBI/2/QDoEaMUx32JJPEP+dFRk8cc3R07gOpoGyzZWH1VsjI6+ibluIMfD1KthFsNNM
         QF0KQsDHz9/TeGRtn0w3q1FJ4AwN3WEsZGMhDPwD+ZhMh/Ts6LC0EbfwwpOyWaUJevCl
         lQ1g/SZE628BO3idqOPfGyEYqRgvUySdoAdo3MDjQx37Y6gBNtvanyqJYFfaanlzHhM0
         Kz6TRLzBuchQeUrWtkYycSufnAGmErPw62DSiWzLqynACivL5089cjj/FkSejP31jSgp
         KT6w==
X-Forwarded-Encrypted: i=1; AJvYcCV2NR0aHqc3ck39X9YLc9x7ga75OaneFUXfD8Kx5bGvCaBcz0dtr2eFAutZS+M8wgzsMbbhLmCw0fzJpkaQbSxMV4bmBH+WYxQd1LcoBl7wob8kGYHVEXxHpo3mujcEO97gS014rHw3AY4kgsU=
X-Gm-Message-State: AOJu0YzU/O0yvphKTbt4vSf7QRpBrTUrz4sCI61k3i3rDzWHfV+aSjhI
	9losjfoLJoyyCGTP5I/BvBXTxsZW9stwSIx+cMmBi8uhXOYlgyqo52OYDuMKN7k=
X-Google-Smtp-Source: AGHT+IE6N9ofhgDo+wpMt2iBVWAehp9NEEUQZUa/JGm5z2Rsthbi2OMLMd/DP0lfES51rjN8UkB9cw==
X-Received: by 2002:a0d:ea03:0:b0:60a:2046:e1b0 with SMTP id t3-20020a0dea03000000b0060a2046e1b0mr1108019ywe.0.1710406808750;
        Thu, 14 Mar 2024 02:00:08 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id fb6-20020a05690c310600b00609fe4e5f5csm186869ywb.81.2024.03.14.02.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 02:00:08 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc236729a2bso612906276.0;
        Thu, 14 Mar 2024 02:00:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4x6rpsRCur0cbUHttCijn979BDtKyVe3X736jda16IOElqEiQiTxfMHnvn0nUrj5GlYzQSza9sStbJrd7aqHpBvFy2QHoKdg/DRGMSLIz6w7HMRC0rkatvHqasKrT606nmb7TfY/1qhiXxLo=
X-Received: by 2002:a25:338b:0:b0:dc6:cbb9:e with SMTP id z133-20020a25338b000000b00dc6cbb9000emr1035233ybz.41.1710406808350;
 Thu, 14 Mar 2024 02:00:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313181602.156840-1-biju.das.jz@bp.renesas.com> <20240313181602.156840-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240313181602.156840-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 09:59:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBK7Y8d5zjdtcvDyRONdGRjT06gb+VbeY8YdU7AUKHVQ@mail.gmail.com>
Message-ID: <CAMuHMdVBK7Y8d5zjdtcvDyRONdGRjT06gb+VbeY8YdU7AUKHVQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] usb: renesas_usbhs: Simplify obtaining device data
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Huy Nguyen <huy.nguyen.wh@renesas.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 7:16=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Simplify probe() by removing redundant dev->of_node check.
>
> While at it, replace dev_err->dev_err_probe for error path.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

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

