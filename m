Return-Path: <linux-renesas-soc+bounces-20487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC31B25DCC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 09:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BB953B1ACE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 07:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F7526C3AA;
	Thu, 14 Aug 2025 07:39:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F23265CBE;
	Thu, 14 Aug 2025 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755157150; cv=none; b=f3Hmlhefc7FDVoyYftrut0rbTwWwmUBpzcDOS9eyWtlR632nguANkY6QM5hrIp3zxCnf/1Wc89/tSEo3IsRiMuxq6evx4flI55UFFtxGVwKkcPzyVXZxSn6ZLsqhl6IFwX4Uo3PeeszVnI5dpwKP1ziCpBJ/FoS7OefCAAnVnVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755157150; c=relaxed/simple;
	bh=y51OHDLzDKU13LPqqI5U6nrlXyFWgPt9Mwz0jkbX6ZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MCGPojJZnn5NX0VMIpPsZjhd1giLGLs3yyOQh6gO8sXeEvA0GOcN4MdmoKhJHpJRShyAP1sHQcXqG+dYzlOYrTBi3rTIMFCh26d+PkmhAIeVWAEkmiMeOU2caWkHE4hpAndgQ5No2OORyYAufFKLHGmOoNiurvC3w9mJ030mE54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-53b17193865so244163e0c.0;
        Thu, 14 Aug 2025 00:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755157147; x=1755761947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CSISlgZ7w2Pha7sxJ62ESuLVR/2x+3b3rgz2ITxoi4=;
        b=jAAslWWKIo+kpl2k8QoLrT0x5ykuxFDSWo1Z7xBnBdArUQ1abmtht6c8ROv6RPMRGg
         NULD121jSip0HcYAiUrkK8lV2OQguam25lvO4ONqqQ2gC05sItTZOU8pwt7OjScFh+a1
         s4lDoYQOBJkHF61o9z1AAlcTXWFGYNhgtsqkCrrU153OequAAl2pv6PpOy1duG9rSHF4
         sihiog1ffhxRs4Md76q6letJlPAPRpIgmgswNvD6bO27oUR5lNoNrGJ76l/laMwrtMGZ
         fK4z3WQREOpGDP85zzCIHbSHe32o5SplQNUAlzKrxVRZndN04R43Cm3fdhib9T5ZRepU
         nmtw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ7D47MVa/ejlkP4a7p8OOcH8pYVLhTNTjUiA0zlPjvkmmd2Gx1XitdDFX/MvU1wSDVQ/tzgsXsGw=@vger.kernel.org, AJvYcCVtGr0PCQ01g8cz8NDmhOsGbkBGY1pzCZW8v5j+E8ftCK7R+dnFRjsBYLpTZOpxbVzUCb1n8e5mXTa+nTNlsm5zVkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVX34PC1x+SlVAngB5k+FbqyOZ+mm/p/1ltdTU9QDTyiW1VNjZ
	lSdSISRhIDUAQEhB8mTv0bKV2+gnac9rz7BZG6WCnsGlELKRz8ZUcXfV2gT0abGJ
X-Gm-Gg: ASbGncuaqI0NerYY4THqIFzsmGucnrrcD4xO5IjRAaLOtZ9P9leYSMxKhVC6VgBCbCi
	ufd7Ml0bm7i7d8Eb1Bd3TO6Ipr7YAD1oVurW7hcjbqna6JqKGPXzUiJ2mXmAYo6xzvgou8WM6TW
	hsUabcWDt6bHuMGMXT9aD4XMQ9p4z6wZxOvHfJmeBvdFQITBwlAb+OR57DI0w15dhOToOxLld9o
	CF1yPPnSuEMIvC5GRCDVV9NtyfiD05H6GcxOI7qv7ggAsUrvYN7sbOKM3nF77w17SQ41LaC4W/0
	X8z2+09s4T1YdjwfoCPoi2Dga2OtJ2tq8kftTxlcqEtpq2tQu8hWRfheYW0q4qheHGG8HFmCN0A
	y1WK6qO+Nb7WsY/bxCQe6H1yJbS71oIC27YJuDn3fqn7yPSug13ROBL6z1YV2h0n7
X-Google-Smtp-Source: AGHT+IHFNqVR20akOJ6zI+zraI2c/n/KvWsf5prEd66q3Ck4g/yiMZsRAB8mVGFYxRZT2dVG5hpDnQ==
X-Received: by 2002:a05:6122:3089:b0:534:7f57:8e30 with SMTP id 71dfb90a1353d-53b190d150emr456457e0c.10.1755157146664;
        Thu, 14 Aug 2025 00:39:06 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b0284633sm4387110e0c.21.2025.08.14.00.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 00:39:06 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-53b17552198so226698e0c.3;
        Thu, 14 Aug 2025 00:39:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDTS9rHjc1pn8PRa+Iypq2IOKI58nXkQkiUp6qEU5erOfJJh9m+JZy4lduzRR0pAKaJnqNMHseT1i0yzSbxeKUawA=@vger.kernel.org, AJvYcCVcAq8C15O6Syy7aEMxZ3cQfm3S592SvUacMtiN/swmWrd45oAjhPBrTXK6MbbOTiXKVYDdEttUiz0=@vger.kernel.org
X-Received: by 2002:a05:6102:54a2:b0:4d7:11d1:c24e with SMTP id
 ada2fe7eead31-51002815a30mr587814137.21.1755157145213; Thu, 14 Aug 2025
 00:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709205532.747596-1-chris.brandt@renesas.com>
 <20250709205532.747596-2-chris.brandt@renesas.com> <TY3PR01MB1134628601112EF2B32F3358D8648A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <OS3PR01MB8319CD026C1E27CD7FB736F28A48A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <TY3PR01MB113468C7F195036B28A70E9508635A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113468C7F195036B28A70E9508635A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 09:38:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEJO1rNACo_LMLUC=NFAZJzsY5zwR0a6to=sf2QBNw9g@mail.gmail.com>
X-Gm-Features: Ac12FXybgjD-wOo6w-nOUQ17Up2NerJuWgpZO8qF-cSYQtQTjRDQ90qu61zjutQ
Message-ID: <CAMuHMdVEJO1rNACo_LMLUC=NFAZJzsY5zwR0a6to=sf2QBNw9g@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
	Hugo Villeneuve <hugo@hugovil.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 14 Aug 2025 at 08:08, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Chris Brandt <Chris.Brandt@renesas.com>

> > > > + /* If foutvco is above 1.5GHz, change parent and recalculate */
> > > > + if (priv->mux_dsi_div_params.clksrc && (foutvco_rate >
> > > > +1500000000)) {
> > >
> > > Check patch is complaining:
> > >
> > > CHECK: Unnecessary parentheses around 'foutvco_rate > 1500000000'
> > > #146: FILE: drivers/clk/renesas/rzg2l-cpg.c:648:
> > > +   if (priv->mux_dsi_div_params.clksrc && (foutvco_rate > 1500000000))
> > > +{
> >
> > I saw that...but I thought the ( ) makes it a little easier to read.
> >
> > But, what's the general rule here? Make checkpatch come out perfect?
> > What's your thoughts?
>
> I just ran check patch and it complained this.
> I am leaving Geert to comment on this.

/me chimes in ;-)

You are not required to fix checkpatch warnings or errors if you have a
good reason to do so.  In this case, I see no reason for the parentheses
(it is not a very complex expression), so please drop them.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

