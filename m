Return-Path: <linux-renesas-soc+bounces-29347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEdxL9EItGlvfwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 13:53:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C52BA283453
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 13:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2156C3006038
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 12:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C56137F8B2;
	Fri, 13 Mar 2026 12:53:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF63A37CD5D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406395; cv=none; b=cdCstqBr/2vxu3bF3WodeUrI/R4QJcAUrD2qVWGEsZ3Tm8ZlcAqDqMeSy9MSmC/NYw7+D8G9H36ahdo9w+fHI/C0fHCyBm1+YdDrS8T7fn6qfBzEF40wmmwm9PWc9EVqNH/H3MkYXI0lf0ZGR2jwTtkGBwZBGm7sIXoX407lm9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406395; c=relaxed/simple;
	bh=v/kUt2UkC9EYmGXyCpQ6b1R76ztbdyTUZMgEwPCUjls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CFLCgvraOs+dJyc6IX8matSS025XkIq1Y2NAWYH64aRhrgzDIhkosvaTwoHpDZ6fO+qtlrQfKGxmqZIre0bIrhysmiSVBxg+waf4A7u5iRcOrwZJHKG4MOZUOyAQKFRNy59mfxqV57XOMUsFF50MNyU+5vGp1TbCChDr85sDtkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5675d609621so1795948e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 05:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773406392; x=1774011192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pK/W1hy2/xfxciOMDtE3+3Ru2vqmuhQ0ktnlT6074jQ=;
        b=QfZXlwhN/ViePa+S5ZSGC+PnQEg0jXz20UoD00cMXJo7c5p75IChEeLfODON0HtBSH
         7GPD3H6zVoShI0nGZ6MsykHHX29NECoYTYEGy8adnpvkywgG1owGuCt5Q9toMmm+pde1
         wc5YUMs3f8q3Ezg10P/tfek7vTjMKkB9lIHWO+GyZzTfmRvyIcYjSsRacgdMID1NuMYA
         mc05J91OliD887V3qVGrQ/qF38JASFFpD5Xc+X0P+eksp14OXRw+ID1mXFe4xjJ+ZbKx
         CJPiBj5aZpvtyPCOLvuXRTaG/7H2tQ26oFTpRZQmgs9l7BR5io9YRqtnRT+7PXIUOTj1
         hmbg==
X-Forwarded-Encrypted: i=1; AJvYcCX678xpKZxboK6rsnvr+Wgi2dV8GJX3uEn7wkbYZn2PHGiUpvn1oj1ZPUFRKnaUbPNuudA32B2+Je2xQB/Ok5hH4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgX6pepAOogt0TyTImdnQG1w6i4rzQiLM/TZb5gMZWsiWXQEzz
	AhojcmwKvqT8n3/pRsnbxgHf3GfS98cay4p6S6aChXLqUw0S5hYF3R2JACzVw5Fv2Ms=
X-Gm-Gg: ATEYQzwk8TIo030EdZ7b4ozflGevAvkbSLv67cfgCUqSNq/03GoOyG0D36mXO0WpuRe
	gaN/tDbkEgNd32HcConZtbkjGSAl00zLa3Z36ROlhEzjOjOiC56T2WyFvmWu/NEOdfQs8qRj2v5
	qhlWWWqUCarV9Mx3SirmckhSXVhyzl86pZvtYhFiaeKellVoAjSy+GK7Ybj3ZFpV1qqk7/L+BSH
	xvJsWaJO8H/PKChOc2gJN2lVsYE7W8+4B5fsHLv+uwla6cSEw3IwfiMz1aQv9fDS8PE2KBYofhI
	p/ry9D+0RjakviqB7lu41XZoutT6eMpxQ6D92S5Wodu60WyDbsVZedpZ5Hn3uTXdWYiXk+PD3QY
	gDO39iLboSJwex6oc9ipzp/ptb7CdUOqTop4L42qQLA/bKVz8cxah3ehCphF9gsP4vXdCUTuxmb
	CxGFAg38Zj6I36EyXEU6TgmjlBdk/HXZe3DW+KXe0LueImWYmxxkZUtD6vwTZm
X-Received: by 2002:a05:6122:3293:b0:566:cd52:313d with SMTP id 71dfb90a1353d-56b629358b0mr1277740e0c.16.1773406392339;
        Fri, 13 Mar 2026 05:53:12 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b464c2924sm3801219e0c.19.2026.03.13.05.53.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:53:11 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94acb3d6cceso1187384241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 05:53:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUk6GaXXMKvx2CY6nOGLQLScbM2mN3RUjrj4VPJO8fYMn5OWUSPcbJziEevyFLWdbJBWsipcj3FAt0mEQEHDXIM7w==@vger.kernel.org
X-Received: by 2002:a05:6102:1625:b0:5ff:c6b2:efde with SMTP id
 ada2fe7eead31-6020e203097mr1411287137.6.1773406391365; Fri, 13 Mar 2026
 05:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309165946.3003731-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260309165946.3003731-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260309165946.3003731-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Mar 2026 13:52:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZnrQQXH524y9utjCkT_0m-XGi=FzUm-JJkCqjbQV5pQ@mail.gmail.com>
X-Gm-Features: AaiRm50MkDCrsEtMNeWMEePqlp-F7tCRnfoXNsOsID-sX8uJ7ZV_jRaKLD3Oh8I
Message-ID: <CAMuHMdUZnrQQXH524y9utjCkT_0m-XGi=FzUm-JJkCqjbQV5pQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: renesas: r9a09g057-sys: Mark rzv2h_sys_init_data
 as __initconst
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-29347-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: C52BA283453
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 9 Mar 2026 at 17:59, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Annotate rzv2h_sys_init_data with __initconst as it is only used during
> initialization.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

