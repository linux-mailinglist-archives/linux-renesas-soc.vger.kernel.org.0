Return-Path: <linux-renesas-soc+bounces-2598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4192A850AC6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 19:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7480D1C2093E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 18:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7AF5CDC2;
	Sun, 11 Feb 2024 18:17:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5D51E488;
	Sun, 11 Feb 2024 18:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707675444; cv=none; b=FKdr+E1Lhs/BEKPts4dJnvnX+GITw9mooMVVEp2A3MHu/evz6VQqqdrj3RwUZrBl3rBBCimKEAnYGk7DfMqJJJ/fcDzkv83iNngkQOMicpMKGSHojqEFYZPpgcnNf1TDAjOdrsjod9wWigFyvGvixeQUSoR0sVuBujvqpa7uRdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707675444; c=relaxed/simple;
	bh=bWCdHtWj+WWuDZ1XobMwoPj0XHN6B7MIsJejEc72+Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rFQgi/i4o9cdmp/IqB5lsI1OJxgJcZfmUMxmgRv6K5PrHKDZ5EBuSfONZJ+FoJN2dSAChxAJueXFdWKjBP8VNN71TsU4S+tLdMQ5S4/m+ui+/aylmlEF9Z4bbTEABce2xXNRzcPz9Qy1skgKM3p6Q94mEtW/uSQjbYMmFpziono=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dbed179f0faso2463714276.1;
        Sun, 11 Feb 2024 10:17:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707675440; x=1708280240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fP0gbW78AmVjFTJcJpMk0VTFgcBnvKqkPtzNWR65d+M=;
        b=LyDF+kt2YG3Rb5CKbpMPWc8LvMDtDrJ7GfG++Kvs6kEi7CewxdXPPcNfuiF3I3N0Re
         rz/PnDouCdHhLDNDj9RGO+xcyrNZnfKFmoPxAiCMFcEsJX3v/N1iMVWhUfB6rHTW/7Sm
         EZguaBuAdbpUaHsmyuJ8O7zAO3j2t/vNC7v7ntiyQ9SGMGUFlnMONX3+MyjTWtZtk9gt
         r0b9HSfywVTZdaYf3jGbwxmHutOgdSk69gtCyDhjlUhdYhR4POIG0f8GIG8GkgkoyYMe
         toHDYaHsbDzzaGP0A0KyJwBkm7olHo75c8CUwqG4uCt8aTU84dU0+GZQMpX5b5R7vuSq
         7T2A==
X-Gm-Message-State: AOJu0YzG1sJbDyJKyhvd3seAd2ReQyxgP/TWIgNwcCogR02RAY9KYuZK
	tgEO8geRmZvyOAs5ySPRCWwYgeDNtiBrgcGcvNxbTG6F8XtEPZbaQmmywEBsYrA=
X-Google-Smtp-Source: AGHT+IFUAuRe1t1qYuLR436bisybAXCXX9M0Ux1pkY/WPMbeg+3Nt4s5ROftBoOqQzWSTXa3rQrOcA==
X-Received: by 2002:a0d:d50e:0:b0:604:99b2:f371 with SMTP id x14-20020a0dd50e000000b0060499b2f371mr3523446ywd.1.1707675440492;
        Sun, 11 Feb 2024 10:17:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhS4RWizAzM5UckjK+T4uQ+FzcSO8gUaCH6WgInNKe4HQ3rAcfAL5VRJ0xCL0r4EGJWZ9jbLc/bCvsr55ZSXPh8fYKpmbeqbz0j6nEygantkDhAYVd1/+J2DJjVb5Cl64p7pxmSbPU1BynVp5g
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id r14-20020a81c30e000000b0060491bf6310sm814048ywk.85.2024.02.11.10.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 10:17:20 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dbed179f0faso2463709276.1;
        Sun, 11 Feb 2024 10:17:20 -0800 (PST)
X-Received: by 2002:a25:d6c3:0:b0:dc6:baca:9abe with SMTP id
 n186-20020a25d6c3000000b00dc6baca9abemr4769268ybg.25.1707675439841; Sun, 11
 Feb 2024 10:17:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1707660323.git.geert+renesas@glider.be> <2ad6b391-c27a-389d-1933-a6e12c21f713@omp.ru>
In-Reply-To: <2ad6b391-c27a-389d-1933-a6e12c21f713@omp.ru>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 11 Feb 2024 19:17:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqn8vtucjpo28Tw1atSTVKZrKRKPJL1FqdG2h_RMDfPw@mail.gmail.com>
Message-ID: <CAMuHMdWqn8vtucjpo28Tw1atSTVKZrKRKPJL1FqdG2h_RMDfPw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: rcar-gen4: Correct avb[01] reg sizes
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Sun, Feb 11, 2024 at 6:01=E2=80=AFPM Sergey Shtylyov <s.shtylyov@omp.ru>=
 wrote:
> On 2/11/24 5:21 PM, Geert Uytterhoeven wrote:
> > All Ethernet AVB instances on R-Car Gen4 SoCs have registers related to
> > UDP/IP support, starting at offset 0x800.  However, the register blocks
>
>    TCP/UDP/ICMP, actually.

I think you are mixing up Ether AVB on R-Car and GbEth on RZ/G2L...

> > for some (but not all) instances are too small to cover them.
> >
> > This patch series fixes this by extending the register block sizes wher=
e
> > needed.  Note that this has no immediate impact on actual operation, as
> > the Linux driver does not use the UDP/IP registers.  Besides, ioremap()
>
>    In fact, it does write to CSR0 at offset 0x800... and in the net-next.=
git
> the checksum offload is now used.

It only does so on GbEth.
While Ether AVB on R-Car Gen4 has both CSR0 and CSR2 (but no CSR1),
and the register descriptions are the same, the documentation for the
bits is completely different. And later registers differ even more...

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

