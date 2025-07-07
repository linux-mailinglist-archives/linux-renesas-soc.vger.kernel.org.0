Return-Path: <linux-renesas-soc+bounces-19327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E4AAFB416
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 15:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CFE61AA49AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 13:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685B829C347;
	Mon,  7 Jul 2025 13:13:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB94F28F94E;
	Mon,  7 Jul 2025 13:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894012; cv=none; b=X6azo9j09aY4OKqktCw+Wff9sgrwkLWMOgDTUYre7rptPPv6GgxD+OPbhkemDdaUDV+CHwG0A+0CiC4TM/hq8SBwyAkC1Eut30hRdJL68JavfJZNyPG9OXW7UwyjHHt8QOetVezz5yeMiR4gqtziJRVhTskzWYQnPJuppObq/VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894012; c=relaxed/simple;
	bh=4chqhDIunjp5JeZ04kGthvwbjcBbP/ShElPqA5Y0jNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bObhQzIfWZiKOQVVGtzon+Qzv0zgp7+gk9o88CKjZB/PCoN5t+dq2nVJY7E4/pr2GhKEH4SwfhqZX6wE39d68NrQxo1DymQIxzyjHlmN4FK77PQ86WxVs4c3fSstgSu5hKab4G8i2c0eSjnIwCD+QWtWesVFfdMZy5kUhwWC5gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d7f2600c17so173531885a.0;
        Mon, 07 Jul 2025 06:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751894009; x=1752498809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5A4mQ2sj3YnvJWQjhwDdfJtv56v7k+z4RJsYDwtFwY=;
        b=FKAO6sSzwaTuSX5mOPhd2OVGqK0eRJoVhqaJpvqFyLjlyRTa/m+PHY67P+5z7nYmRx
         oimATRhgJcPOgZS5j+vrM0d7TdRYu/FHjsAIrae3V95Hb/VRrnL8MLaATEzw9tVUgVWe
         TBp+/a2UssT4vwXLxe+BVMESSZ10QHeAln9RtKiATHYlTvH59L8DTbAHjCgxVo3B4uBt
         knG1qPlz429mN4r5d7FMXPHri84DODNy/aAKgLRYiuHle/GMzyTWk/tj9rT0l+Iz3VJc
         uVnxWiF9jjI8fkYR708oUKxdIS9KJGpQYZBz71FZomMtapeyvF8zo1VuZuyKdDPgzJmF
         t0AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1ZtGMVkWDZ4Abziw0JAMn9FVkyr6jiaRxudHzA9whKunzsWL9yJ2tGef2Nb76YfITnypE8zDW1aq/@vger.kernel.org, AJvYcCVApfoLwhfNQe6yRYiDOc2qCZB1/MZvp1TMlSSWuXA2xfOwpilGB+eZfSG2e4iVGRxw8TJp5Ygm304pkKOH2OjsTkg=@vger.kernel.org, AJvYcCWIu8INC/pPbg0bA5n5HNIrNTQgiRto/ScuT2Kg1jZJf/3OkliLb+wTMhHpkDBXe99UtSXM6u+DSIyCR5I1@vger.kernel.org
X-Gm-Message-State: AOJu0YxpTs/OwGoQ3XoVvqpaKN92KlP+ugFEIcqVVeB8tkXlOOZxmb8+
	k3JOa6l9lwSvMxzZ8oAZEogNwegRSg323PxDn3Tg0MrqGHz08pgedEPZPtEP61g1
X-Gm-Gg: ASbGncv4aeoc8qO88HiObR/znTFJMSJm9LQ4rX+WYROaV+rx5A/12bx58EKnP/qAOSc
	JSAz9e9NmBzUPElI5AP2UjgNWPdVRkVJuxVXJF5RAtWZKgsu2d2zsyE7IEVDEeTYPI94Jv0DDB4
	50PmJvu4LYa5uKWgYSgDMCRhORfG2f1g1XMH/44/Cv3dVyJj1K+X9Dhk12tlkDe8nRtpYbYijJH
	Gko+lAEO7srbxeg89oBLPgHqSHbUXo4seFv+qLHVgtdKD4SBwp3CV4erdVwvQRcHBCthiUuJjpc
	c3cRq+vIoWlz06qdvcGZKnnlT61JRn+FYULSpchO7hGV0CqjAZmLlWNIZgiAJ3ILSrALEDvCvBu
	rUuH2bTNV91hl+VDqBCmdifMUYs7mB+h9n5Ly6QE=
X-Google-Smtp-Source: AGHT+IHN9o+/oZ5fF14nWIc5tY5Iz0i1syS2DkIDgNvnt/ZJVRdqjncEOcfoi5gf5wpEaWdM/fRH2Q==
X-Received: by 2002:a05:620a:4553:b0:7d4:6123:fae0 with SMTP id af79cd13be357-7d5f17e8e0emr1421017585a.44.1751894008802;
        Mon, 07 Jul 2025 06:13:28 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbd93e10sm605359285a.5.2025.07.07.06.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 06:13:28 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a9741b513eso69343221cf.1;
        Mon, 07 Jul 2025 06:13:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUG9gv99/WVD4/k57vxG3abLBeA21MrJezCkvAdqzk26OCuuq3na93GYVNKmA9pgQtiksVXmrmeZJxu@vger.kernel.org, AJvYcCUjtaRilQPvfxB2FSjYmLjHdx3veJ2XnzuApEkhzUgana1B4HQ9xXbKi9i7qU+51T9hTjDvc47iF+i8kqGM1eDwfbE=@vger.kernel.org, AJvYcCVHGwqxjMP6TW6o7mgvlBP4+U7BQpLIRxMoCgTKtIhwRykdVTBHFcSxYpaXkhw1ubXWLk+yoQuM9b3N9qv6@vger.kernel.org
X-Received: by 2002:ac8:59d5:0:b0:4a5:8b39:626b with SMTP id
 d75a77b69052e-4a9a69a26dfmr148018231cf.27.1751894008321; Mon, 07 Jul 2025
 06:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704140823.163572-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250704140823.163572-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Jul 2025 15:13:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTEoi8D_9L_d8VPkmWYeU4vSYw6kQwxGuYMaQ4h55BwA@mail.gmail.com>
X-Gm-Features: Ac12FXx3LHe-a7yTaUPt9CR4AOBP4CmYZh5LHUSoBAQwdhq8-wvOnVoZrUcevpc
Message-ID: <CAMuHMdWTEoi8D_9L_d8VPkmWYeU4vSYw6kQwxGuYMaQ4h55BwA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: renesas: Add XSPI support for RZ/V2N
 and RZ/V2H(P) SoCs and EVK
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 4 Jul 2025 at 16:08, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> This patch series adds XSPI support to the Renesas RZ/V2N (R9A09G056)
> and RZ/V2H(P) (R9A09G057) SoCs. It introduces the XSPI controller nodes
> in the SoC-level DTSI files and enables a connected serial NOR flash
> device on the respective evaluation boards.
>
> Note,
> - DT binding patches have been posted seprately [0]
>
>
> [0] https://lore.kernel.org/all/20250624171605.469724-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> v1->v2:
> - Added Reviewed-by tags from Geert
> - Moved assigned-clocks and assigned-clock-rates properties to board DTS

Thanks, will queue in renesas-devel for v6.17.

    * MT25QU512ABB8E12 flash chip is capable of running at 166MHz
    * clock frequency. Set the maximum clock frequency to 133MHz
    * supported by the RZ/V2N SoC.

Shouldn't that be:

    * MT25QU512ABB8E12 flash chip is capable of running at 166MHz
    * clock frequency. Set the clock frequency to the maximum 133MHz
    * supported by the RZ/V2N SoC.

? Or am I misunderstanding?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

