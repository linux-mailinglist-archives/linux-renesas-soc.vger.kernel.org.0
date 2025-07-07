Return-Path: <linux-renesas-soc+bounces-19328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9DDAFB44D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 15:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 789777ACD36
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 13:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B507E29A9ED;
	Mon,  7 Jul 2025 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1Q3tjZ2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ABB2951C9;
	Mon,  7 Jul 2025 13:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894412; cv=none; b=rQA3gdR+A31fYp+b01E2SnuT2lg2MCZ3eOuhUfQFIaUfanThUbNDc9mLxo3Dad9nF0+rbNp6UXEQEwa0JgFvJQWfC5kVCnViq0uywvSaUs1n3UEEtNIolodACLHOTjVHiQrd4x5psGqGLF/QK31E1DLKw7sxSTkyq87St2ENrBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894412; c=relaxed/simple;
	bh=xoB1WyEbYd38M3W2fNtaRUQcY/gF/PEsOXZE8HV1CQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ldef04pM2Y9QCr7JxUFHGAtkFY8sgmJ8teuIKfSD7D6apugcMWpnQM4ZWiq1nXleckaDHIoNC81U6S6zVmOB06JzVeu9KYtqU0CbwJwkq56UYp/qno4X6AvJtsS5VeMmjA5mqji1evDAD3h0x5W3LXgSrvy4xb6e8htxs/fBxfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1Q3tjZ2; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so2641647f8f.1;
        Mon, 07 Jul 2025 06:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751894409; x=1752499209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eerUfVicZJ5Tr0lacErP9NwMN4xIWkkUXbyv5LvJwlc=;
        b=Q1Q3tjZ2/1RRBpDo9L7W8zrygSdWxbAty2QBwJHgVULKTZFSNMPeuKZ+d37IKnSNzm
         pP6zSNo1w+hpS99evTgrHQTSblHasZjPluVtAaSc1pX9zjD4wGFDJqeykw72QPgGPc2N
         wSe7YOOMZITLqXeALbDR9w8tW/Qh7f2R8h47VZ1gkwxbSr3FQthB5bBdP2ysmNdKg7lP
         X2C+/SmkaEQ7zOWn03ARU6fTybjbLr6ArzjI36tIUI1JSmvO1MEWgKsjSoKu+eIYSdcE
         f5ULMNm/TwEXrfwse/gbarNsKmS9vGQuuZnaUTLrE+zuxDl1BHj/rolc2ajYKTxr32u1
         /unQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751894409; x=1752499209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eerUfVicZJ5Tr0lacErP9NwMN4xIWkkUXbyv5LvJwlc=;
        b=M9sbD0Q0xxCk+c43KNeT9JyxdXfX2tnY1s3QE/h56PgwT9E/7+COxtn98S9EG9UGDL
         PnsW7gFv3NXrD9nXj+hJM18xLzMrmiBYWl2l+r2h7/noC5VJWZedBwh8TixC2OeBivQ7
         2ISS4mrulwbkWDPzznhKlijJt+xzc2t7BYPTK9dMoMXvO6Tg208bGCKa5JcJBmX9mrSe
         7/6pUhTGlBwmPjAGEscjccS8Y4QjFG0GxhrDqaFwj9QxeFxJcC09sm13JKpIAHdQ8zjp
         siWpfooTn/ABxcOyP7oj4iDURGdt90RKIvKgsfus8XKE6l8VkMh+tO6VIBXmaWxMS/8C
         KiHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU++AHeY1PuLlt0HlqH35WJ2SmkBv2AXDauTQGqk52b7D0iWwK82OpP3Rg7twe1BpuXDtl2LW+Gz+8Hx30ge7JLh6U=@vger.kernel.org, AJvYcCVpS0o4tYHbbmh+nUgUKRihFR2veXY4GMH/n4XNdNmZS13Nm18OK2n9sFaZ2K9IpVx/NrcH52rS8Sbw9Ya/@vger.kernel.org, AJvYcCWzWCuJ8rNYBMGb6XkBGL2B3zqg9tWHCdfMzfp94PNGM4Y5ov5hqLuc1flGu3a5ADrJNVZIOec3zTk9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Bvam7xNE1MOfgwxSGz5+ZQMd2v3Lnty3mnY5O+Z4ynBjeq2Q
	LqqbbXoxzNyD+O+T1tiIOticjHqXUZeolsXJkttG5X1YtPvo2OnNwYnqgwbWhuWJdxiGhEHRx7e
	vo8KmudXJoi6mmUstt3RRIwiCnceGGlM1Fg==
X-Gm-Gg: ASbGncvbIucCKkJPdw9mdoyCbokNAFI5mcjnTpTswZjQAlVc7arAziye71ZoYvbjGWI
	jffPArDAZdxXD2ULcPGrY5Bz81k4yYvQ/0QhGCgO4JN1ngiGOCsmjeXfjHj8RDgZIlZWiJhwEPh
	Ow55dnh1p7U6j6SBE3R49PVt5K6+cO9boyafdUhwx6WvXz
X-Google-Smtp-Source: AGHT+IFam7AnBmamXnUVOGlJsNUroZcSdV81Gst0xilS6Q88T1PHuQXpPjhkDCLk/4lhHarbdYm39Y05LUdLc0jcq/M=
X-Received: by 2002:a5d:5f53:0:b0:3a5:6860:f47f with SMTP id
 ffacd0b85a97d-3b495b88eedmr11142660f8f.6.1751894408902; Mon, 07 Jul 2025
 06:20:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704140823.163572-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWTEoi8D_9L_d8VPkmWYeU4vSYw6kQwxGuYMaQ4h55BwA@mail.gmail.com>
In-Reply-To: <CAMuHMdWTEoi8D_9L_d8VPkmWYeU4vSYw6kQwxGuYMaQ4h55BwA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Jul 2025 14:19:42 +0100
X-Gm-Features: Ac12FXyOXebKNCVjvBbKSEe9juPyDNX0CdFTyS0OfJnPu-NDWx-uN_vg_3ec910
Message-ID: <CA+V-a8uwzKcap_O+rcdUYoaHONByAWqOGs8cd-5PLkLyCfK3dQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: renesas: Add XSPI support for RZ/V2N
 and RZ/V2H(P) SoCs and EVK
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Jul 7, 2025 at 2:13=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 4 Jul 2025 at 16:08, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > This patch series adds XSPI support to the Renesas RZ/V2N (R9A09G056)
> > and RZ/V2H(P) (R9A09G057) SoCs. It introduces the XSPI controller nodes
> > in the SoC-level DTSI files and enables a connected serial NOR flash
> > device on the respective evaluation boards.
> >
> > Note,
> > - DT binding patches have been posted seprately [0]
> >
> >
> > [0] https://lore.kernel.org/all/20250624171605.469724-1-prabhakar.mahad=
ev-lad.rj@bp.renesas.com/
> >
> > v1->v2:
> > - Added Reviewed-by tags from Geert
> > - Moved assigned-clocks and assigned-clock-rates properties to board DT=
S
>
> Thanks, will queue in renesas-devel for v6.17.
>
>     * MT25QU512ABB8E12 flash chip is capable of running at 166MHz
>     * clock frequency. Set the maximum clock frequency to 133MHz
>     * supported by the RZ/V2N SoC.
>
> Shouldn't that be:
>
>     * MT25QU512ABB8E12 flash chip is capable of running at 166MHz
>     * clock frequency. Set the clock frequency to the maximum 133MHz
>     * supported by the RZ/V2N SoC.
>
I agree that the above makes it clearer. Thank you for taking care of it.

Cheers,
Prabhakar

