Return-Path: <linux-renesas-soc+bounces-32856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNexHGmBDWrUyQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:39:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E2758AEFE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23F2130D5FD6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16833C1406;
	Wed, 20 May 2026 09:27:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B7E3C0A12
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 09:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269274; cv=none; b=moQSo1L/TF2PxFTiO8VeIfOA2E1b2CoJIclFR9uVt8ky+0eQfMG4gsQweIuEEJyH5Dwa1fPPjSRmfVJOW9laFJhGTafLxAnPYSrg33d2kODUAJEebqzqNDanXdwk9/xdKemTK8KCcZdlD00dpqTT6HuKl7YE/maKqlTi7F+tni8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269274; c=relaxed/simple;
	bh=cqcKGoxGxtGWXpqUGB19b7cxo39gytYLyy/dKTEdc5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n53K/iJ4VKN9z47v6967MdHplgBHgn3SuL2iyyFcoH3gb+iWy1exXqkXxjCC3yaao3nlueCW7c9ow3UjZkjWVRditRUzZwGLrMPUAiLq5Hm5r51wVkjoiZCG95s209JbgDu6Ij+jgrTOVawZEdNO+7PniifIZ8hjq5WJwSP12Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-90ea08cc5ceso791035085a.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 02:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269269; x=1779874069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSg8CcmcyzhUpjDW73nfoHFxPOMVgUx5GEZqNXk4ccg=;
        b=VBBlcChGJk/XQV0Kyx6PC7c3KrAWF/BzmyOnzbSPt72pP3g8XynLt9VrgqXeHAOy8K
         2yy09DnlrXOMhmkyEogDVdwtrB+PaQspEbND1OorhrDWERYhx991/4W1UjKirPq0UYSd
         HFjcD3/Z3HQgmzU5mR/ToZ/73KD5Iqplum44pKcSOe6Yz8AI4lBV8Yv6t7h/mBe2BWQ2
         N7rF9uvYcUGjQOdDzA/vsPIDxIxwmCfWPToAeIkb7/Wz7EvvJ297j9g92uC5tHbn49KY
         54jfYgHbe7+7Xw6vaJFdq8/9++ddI/5IUN/7+nHFaqcvMaVgxqlHqkZudFo0+Lm0rUwW
         TeLw==
X-Forwarded-Encrypted: i=1; AFNElJ8cGi9nB/hBMzelwqMRVyAwEZTJrE8f4yEjKU6SAsfIGPhoIiCnduJvbopLIh5ZhoqCfUpv8QVnfEIJP0fXmoo2Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhM+tGXtL391fbpOA3BHLQpFgBhk7ygeiwnET4hQUYlAmg+47l
	D/0CxhfJ+Dg1fvMzaFhTSRM/m44PIdq2H9HvTlbD6PujxKh4eeEYWSyqDsefl0RyvEI=
X-Gm-Gg: Acq92OG1waGMYeYLAaMXPg93JYGEIyv81ZHtTnfkUdx0cIcEtJvv63dIOXQphWNZDHX
	YSwpSJ8/ytTYV9Qsm6R+Rvxns/utHtxtx8fGfxvdSLjpfFIc98YTtpeD55CFe3W3FaTVZXW28dp
	k0aL/gReoD38xIx5/ZTrfSa+cOwqjo1vvgwbDPEP9rSWPXgUrN4IxGV2cC8BLOF17bjltrg43vh
	wmp3Z1nDhNWCod3ZFXM4Y2+tVRzhQ2qqfToyjTf8pa6U7VHs24RPJrqcDsMAgB5X+N37pIMaIkS
	ZqJ+M2bu+Dd/2r0oAcTemsdk3E7RKoBRzl0NjhqudHa3bbX/f0z4x3bKpwGPJctVWqH6iZEIfBU
	zEaBuAOZ6K0w/+1UsHVAIE3ead+zuX4aUmQX+dlaKOudNzCNHwkrQwDS3kLl1l+nSAvCxW9hAIG
	YE5OC2HzevCbo7PnciG4NCmgSHVPqyG6Fhwhkk408GVeNWUXqvCwEdWA3RRqzI
X-Received: by 2002:a05:620a:4406:b0:911:2d04:6649 with SMTP id af79cd13be357-911cfbd1dd1mr3359719585a.29.1779269269224;
        Wed, 20 May 2026 02:27:49 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910baf22315sm2144452385a.21.2026.05.20.02.27.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 02:27:48 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ca12973e15so64656416d6.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 02:27:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+U5bAP5c0I8gUcFNQY+r7EBDAl8+Lz0Yp1zgw+E3Sb0YQEyROxNkktIWBrTN4MZn77v7ZSMaQp0OWJFeY1sryp0g==@vger.kernel.org
X-Received: by 2002:a05:6102:3e1a:b0:631:28c1:154e with SMTP id
 ada2fe7eead31-63a3ea83841mr14744535137.16.1779268834569; Wed, 20 May 2026
 02:20:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520091111.67666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260520091111.67666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2026 11:20:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpa_R0C70eJjS6urpSx3jtcVnbjZ8K0OvhO25Bx1-u4g@mail.gmail.com>
X-Gm-Features: AVHnY4KsTghlnywZI5vA1H9Z8FXzfT5cshnAIjblbGSvrCdV0vTaYH8EOrOdrQA
Message-ID: <CAMuHMdUpa_R0C70eJjS6urpSx3jtcVnbjZ8K0OvhO25Bx1-u4g@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-host: Remove unused LIST_HEAD(res)
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32856-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,renesas.com,kernel.org,google.com,glider.be,gmail.com,vger.kernel.org,bp.renesas.com];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: E7E2758AEFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Wed, 20 May 2026 at 11:11, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove the unused LIST_HEAD(res) declaration from
> rcar_pcie_hw_enable().
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pci/controller/pcie-rcar-host.c
> +++ b/drivers/pci/controller/pcie-rcar-host.c
> @@ -346,7 +346,6 @@ static void rcar_pcie_hw_enable(struct rcar_pcie_host *host)
>         struct rcar_pcie *pcie = &host->pcie;
>         struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
>         struct resource_entry *win;
> -       LIST_HEAD(res);
>         int i = 0;
>
>         /* Try setting 5 GT/s link speed */

Indeed, this was never used since its introduction in commit
ce351636c67f75a9 ("PCI: rcar: Add suspend/resume").

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Since this does not seem to cause a warning, even with W=2 (TBH,
I had expected some shadowing warning), no Fixes-tag is needed?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

