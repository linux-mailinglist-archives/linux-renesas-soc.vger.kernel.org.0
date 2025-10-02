Return-Path: <linux-renesas-soc+bounces-22587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F160BB3F9B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 15:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E12B03A4E81
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 13:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57E52ED17B;
	Thu,  2 Oct 2025 13:02:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592022EC08E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759410165; cv=none; b=oc8mKuXU9OaT9wi9wOCUUeeyNK5QJxzJb3ZUng+LujI0wpldwhcXl/0Y8pE+YtxiO695GLbB4PzIC5q/1Urkx+zGouk5zW+olqcSNdXv2lMC3zeVUtCMeTu2w0+7ji68JXTmjQJkHSVcao1LeV1q+3L/7vF2VApwdzZZ3BnxGVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759410165; c=relaxed/simple;
	bh=UA6tTZXqaCOK2NigC5FAobaKNdJkRhWjZa2mAx2vxXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3DAqsDk9OkNru2RLm1vseG/E3WaphFDp8v7fPqrXDMDWKGUv8JQUvxXoOfB9vH1slTDV/Gc2KEi+UyRreIgIrVD2Y5v7uFMOaX3rWfshPAx/rFTv5ZkZwvQxoyHgWLrO2xZh5FTwdJgovHBC/l8bBZoUGUUs04tKkHDl+ATSnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-647588475c6so474381eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 06:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759410163; x=1760014963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3dE+UYXSAYSMrP4rWfQs9LXTI5k4tbEHLzxqaY9yVY=;
        b=Pc25+Z171ArqM66wf4tyc6Zxlrt8TYFPZokHQKV5uJ+3vVDYMFAcfMNCv7NpAuSMDP
         bND0wQstiFoV6ya7eeDBMxMWnV8Czg6kdUAWDYyJfmgAVVXZWtjcVzJkfVG44e78+e08
         +3w9tgE1FELfpmMv2B4rbt912ytNhel0eRpiZUMHd8xI+bTccn/r7smtEZ9dluS2mvN6
         7yKCWlSRBZ6jSRuCPwNoWeB2PtBJMml/VQZKm27oE81PkwX0TakiUfTRdp5Jd3tSiohI
         lbjDXtpOXuJ7OFLkJKAErF6NeSFrWO8sgxf9MP6dw8vS8pI8Uqdsa3XZz4bmKDZ0AjMi
         y5kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWtHoAgSWau/BZ3j6p1UL9UyVGH7ukJOms97e7ysZAOXk9Xfy2VVRfnyTguq8r3vZCqKuZucPmp6w6tmI+EwfnLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdFB64xuXEkFBf6iJUTj22gAb0Qp5XFJ1WEYpgU2If3BqHwDT9
	kasBtc343n8zGZ7B9yYCuDx4n8q7xVNABG1FZJojb1gkCEiFKzw1BlP6Wv9tkw1icMY=
X-Gm-Gg: ASbGncvKbNpzte923Eaz/oCdWjiPTL1w6GKr6mFA7mD2rUj5EciqayAIibu5fZHmqrC
	cb9/mHmgdLL/s9/FqO050gJlKk3Tg60UgEWe++kBnk/QlY5BQWnhvJWrU723BbT/4r0GHmHDPej
	HN1Ag85PItsh15qSTMb0bi1y/GskG7nseZj+HYExQIPfTwxT+RUH+OaIYZJTVDhVK6QuzZ1vMu6
	2MXZ+B9rqJdQJkcs2rXbin9nzwS6HFRc/r0hBwNKF5TVYHn+oauLUstnlsoN7EAySMykpUToYEg
	5a1dIzpU8g2zMRfNcl15KHESA9JvMyVtymEm5tdyzNEKSCuxNpDvK0simJNeV2OB65bChOZEdUM
	ZeD2BIWT36YMKh7eRatZoyKXNO8PfikxivsZ+g+FJKY4PJuvLYAeApUYHiPC+gHWEgnkefDyU5U
	CEvEFh8bNvGM8yIQBd1nU=
X-Google-Smtp-Source: AGHT+IFehzpxRtz1HeWSTAQSXl8HGngba/Zdq1caJmDvAs5KLVap7s9MkjamvQItURMxnI8M07WB2w==
X-Received: by 2002:a05:6820:5053:b0:63d:159c:1a69 with SMTP id 006d021491bc7-64e02c05d0emr1522653eaf.4.1759410163133;
        Thu, 02 Oct 2025 06:02:43 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-64e188f3eb9sm454043eaf.5.2025.10.02.06.02.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 06:02:42 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7a32c0163bfso1385885a34.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 06:02:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMu3lvsScc0NmWW9jNX52GR2QtsRxLc8qjhCeH9Wqb8t5IoO+ojj633iUqUH7251aJfZrWh+jA5KmzMNgwlBqyoQ==@vger.kernel.org
X-Received: by 2002:a05:6122:e017:10b0:54a:76f6:99e6 with SMTP id
 71dfb90a1353d-5523c01a219mr1048867e0c.2.1759409829773; Thu, 02 Oct 2025
 05:57:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002124735.149042-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251002124735.149042-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Oct 2025 14:56:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXA0fWwO_5bBud5FE-Kwp-7zU_rb9rVPcuZojaNJT=tkA@mail.gmail.com>
X-Gm-Features: AS18NWCCYsMv_0f38WPVlVfiPUyz1ABU_-4NHROasZoc_Eb-IAFzQ63J2o9bB7g
Message-ID: <CAMuHMdXA0fWwO_5bBud5FE-Kwp-7zU_rb9rVPcuZojaNJT=tkA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: sh: Kconfig: Drop ARCH_R7S72100/ARCH_RZG2L dependency
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Oct 2025 at 14:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ DMA controller is used across multiple Renesas SoCs, not only
> RZ/A1 (R7S72100) and RZ/G2L. Limiting the build to these SoCs prevents
> enabling the driver on newer platforms such as RZ/V2H(P) and RZ/V2N.
>
> Replace the ARCH_R7S72100 || ARCH_RZG2L dependency with ARCH_RENESAS so
> the driver can be built for all Renesas SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

