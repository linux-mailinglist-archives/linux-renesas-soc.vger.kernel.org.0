Return-Path: <linux-renesas-soc+bounces-15197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F99A76AD9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 17:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06D111886D1D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED03B1D63F5;
	Mon, 31 Mar 2025 15:20:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8CB215181
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 15:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434401; cv=none; b=Lq5SFZniULBb+D6D2MxuogZY3WCkfTRK8Ao3MQWoe8oWG5i7RyNynsOvHgTtyJX8N7oTCw1A/2lbGdhcKkuVAgGF6h00PtsbzglruYpyW/9UxKYgr8WSQkUy2wX7vFBn8n4hFHpvRMNJ4JaWYUGGM9lzStOQwr75WPOGn1AqB4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434401; c=relaxed/simple;
	bh=DImktFX/no4k5w/spejZvtJ1hugiDQxsfjnJjlGFQ3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbkP5mMwI4SIk0G15sUQl68+xDxEyzXw+qDUOvrsYiH+GVLtM3mZMxcVP+ZYMW3tqCK/jCHwesVm1iIF1cY1ca19h62AR/HnKBR5r9KMy1XKiRPwKMReqidR9XQMCYRiP9e0OzyiK7rtiKU/4JVAU4VxBIVK4SQpWvKP3Z/Pu/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5240764f7c1so1800892e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743434397; x=1744039197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7UICPDnAzfxNGeFbyWfqjF/HL6NUEULSfpnDnljDM0=;
        b=vr7ZaP7xHW9sxMDvegCn59HwkhSoPPz5+OqODHFECrAmdDSvQpeTxJQzMQpM4BPjRa
         KFMKVCTvKyGDeHNaeisVxdAziqwNjw/SDuwf/uEB7ykJlvisX+4e+I54g2Gr8BObgH4G
         zw/5MiDKKnt7hsrT2i/wk5hu03kZpJpQHCycPhkWItKWHpvkmrujfIAlg8jknQ7V2La+
         PC0y3PT+fm0o9DzoOIK+IwJZfHvTSbZ+nciL5oWp94jPA9IDhnkyuTAULsebgGay5yUC
         PI198oWtDPw03l6Z1ISPQ4dDYdbOmj92p/KgmCapvaj7xXgYnsc4R+1yVWdXj688TvFj
         Sheg==
X-Forwarded-Encrypted: i=1; AJvYcCVz7bIwaLVTPm8glSxZw6oiCOA7UETmzvAn7Uka+U+vY72UYv0M0ckqo7uBBzWxNBSvguUuv4nd/lEPTM/b3QqOWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJVy6A6jna44B8L/uvBHUxGH0WwXQ8bAN7YAgiDO86irAFbO2P
	Wrg2DiNtOXYmncALWkkBKsXhHnefNuLxcMsJoqtssa948m6tEwslE6MEJ/nN
X-Gm-Gg: ASbGncszsBpmEHzmBNUoZj3Lp4e9cAKV4n+guj4ZTpldLAfeCCCjmywiuICwOEacdgQ
	IWloBrUl0bSrLBUO4YL+GLAIkkesDvqwHeMOuM+F2RJ0pFoyTHEMNbnUBhzS78lGtE0xMAt4zMy
	6FMCHtIDYtrcC8MoUlufcH2BaxjUsxqOYHJlaK1/ESeRP8gxvAjR7Heif6cSu+EdZJo4eVVtlah
	ioEjFJ3SYlCK6zeYo4kKPBSRm90j8lWUZI85WPncVIUo5agqETWANYaZ331cSp28I/cMdpIR6EM
	qxi43FwFlaUnSCHMltJjWOqRFJxYmQxoLvTsh5Ad3SPHyLdK1AmwCwBxvL6coWogfv5EKKimVJA
	2JuoGNXQ=
X-Google-Smtp-Source: AGHT+IGhNwT2RHfv/P17Dp83IOQtzY95zdPqdPohh2NsUlTVs1QDVzkDSg5N2027jC8FcPKqKmMq0g==
X-Received: by 2002:a05:6122:924:b0:520:5185:1c77 with SMTP id 71dfb90a1353d-5261d469abdmr5314436e0c.7.1743434397220;
        Mon, 31 Mar 2025 08:19:57 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260e6a0f03sm1592854e0c.1.2025.03.31.08.19.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 08:19:57 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso1975237241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:19:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2aqudxOaaMyBTLvsh9lDVmgApp6xGq76B/ECmQp5px2Ld5BI7tdofKCmyFQazwfc2ErYod+3VXjFS53smwDQsNw==@vger.kernel.org
X-Received: by 2002:a05:6102:1586:b0:4b1:1eb5:8ee3 with SMTP id
 ada2fe7eead31-4c6d39f6b3fmr5481862137.22.1743434396343; Mon, 31 Mar 2025
 08:19:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250327193318.344444-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250327193318.344444-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 17:19:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXm1i3BVq2RWG4KBmCnyUnWJr=UmJmutgwdrF8MOOTvLw@mail.gmail.com>
X-Gm-Features: AQ5f1JoCQ1NgVDwOMtspkBXeMy37LF8Cskov2ZuAIX2UCU3uj6E5pnDv8qmBP0w
Message-ID: <CAMuHMdXm1i3BVq2RWG4KBmCnyUnWJr=UmJmutgwdrF8MOOTvLw@mail.gmail.com>
Subject: Re: [PATCH RFC INTERNAL v2 4/4] arm: multi_v7_defconfig: Drop
 individual Renesas SoC entries
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 20:33, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> ARCH_RENESAS is already enabled in multi_v7_defconfig, which ensures that
> all ARM32 Renesas SoCs are enabled by default. As a result, explicitly
> listing individual Renesas SoC entries is redundant. Remove these entries
> to simplify the configuration.
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

