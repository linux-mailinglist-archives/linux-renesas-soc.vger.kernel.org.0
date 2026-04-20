Return-Path: <linux-renesas-soc+bounces-31393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAqAEd3Z5WlvogEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 09:46:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D7174427E15
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 09:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1CB73003369
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 07:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B77F37E309;
	Mon, 20 Apr 2026 07:46:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DDD346AC1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776671193; cv=none; b=JsVqbyJh4sZPnF6zTJXjL0K0Digp1WqfyYZm5ag+A+2MoC30fTf02Ot/jj0h71OsBAPZXxthoD/h4Ra14+ZxVj+W4EPC60/MkhgNza1wgOT3moR83lukopPcDZP/AFmPWWB9robcD1+c9zIUeR6iUut4Rhztr/XUxy2wbS35fss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776671193; c=relaxed/simple;
	bh=Uu9Q3CvMrXJizvKFrRbVnqMhMioHkGUActslcpT+wyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKa4m7s79XMQseoD5Eq3FLLP3kLhUlnM1nO5F98iK2nkbJpOFDI8hlSaU5b/ZdQfC6jYQssMwVJJGMRW2IwpdqFSVpqiXacQVNyLqzvOVMP767Xp1KsXAtTWCDlTQ68/qnpOJNkTqMYp+rxTcd3NlHWKH/ykUtoSYhZWhwq3pZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-60579e72ff9so2039035137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 00:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776671192; x=1777275992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vr9++th+piD84iSgm0F19Q87mZM1OH80P77AJIEKCDU=;
        b=UMRj176cEf3zFQxwruuThAaz5yhbs+Ul1Bij5pMK2WLbIBCq1qOtCzwSFu1etnSovi
         jO6hI+lNsag4DwEBWprTq40D24jbHByGTSio5VXijSdLQMTlxPC901Je1GqWNJqlikzJ
         iJIYEfiD2MK1Q/PXjxV2NS3uVLwTPHMayStu0W4rzGu06DwOT745SJBZrAhd5BBVrCqV
         KMOVdkx6DBDAZuf4exS2il6ArkLIoczYAX61yfOXt0EjZ4aqV59rM+h8SCNZX7asW1N5
         p02ioz67EpeENLsGUdFACCFkxSxf2peTSCdfP9xFXW4cZmgmdUJQQtYCdwg9U6GsSwSu
         uUWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8VlHg+iS7rm6RcMeLje3CEqlNUpO7TLD3XwAdr8rjmYwMOwMIDtAcF6L2q1O/JJMUM2eQVgYVWNmS7cYWHduAeqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyNQuStGUE3GGqQoZRic4I+7LrO4n6NAGfx6vlvwP++NI4t8NV
	3C1+JwZOffp8SABwjQKXWJoHcbGVE8ZEKJ0yy7uS/7wIaG4eo4zE7fTg2RLP4qdc
X-Gm-Gg: AeBDieuzmR2EXf0L1zsQmYX/QuHvqGVWi7d6k3dHUTpkVNWdBKZbxFXIqFqHA59+aqA
	B2UUmxrGSzLMR9b//+BaX5+wIQHh8byRV2Z8fCZCTHyDBKEvFPYEYlwbGTkFBWEiht5Czj8cGY4
	WmfMr0TwOhfiMAs1yj6CKeVkSG9QYme+v2GDtlQYjWETbjd58SYA2hZMCBxuwnwPhrYYmyTm6ii
	W1ebosddSQFv04Xz1IxhPhmzqTn4etiYUC0HrPKz9BE0lV82RW2VsOyNFjwFKCOX1lchOFlIUGC
	35H/Miykt39/JkQ94xvMkg1qrhaJLlv3k2TrOALnEXHOg7t0+pFIllbjQOwZ/S+aeY6hordAO+x
	5mCGxnYuZDU/+sijKNgMsLJJp4tsqR12H4L+QUERNncgXmhZSsxkORCkVC8WXQqO63A8z+JXBFS
	dSBh4wH2wL9ck670r4Ll8jYkfNtAjS5TKNi66CJTVgGztqaw6yY3eVtND3zkd2mCs54hr0hyjLN
	fU=
X-Received: by 2002:a05:6102:9d4:b0:60a:f74e:8875 with SMTP id ada2fe7eead31-616fb583789mr3718451137.1.1776671191686;
        Mon, 20 Apr 2026 00:46:31 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-617455b62a4sm4372035137.2.2026.04.20.00.46.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 00:46:31 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56f72d27e7eso3307746e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 00:46:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/zl+ZIpRmDJ8yAfbaXzJF2xBnTApzjzl2NSJ1q9cdEEnXQj3z/3V/aG55XaT78V9CSp5Qo+K5tuTXcb7y8uRyvdw==@vger.kernel.org
X-Received: by 2002:a05:6122:289a:b0:56b:9534:c06f with SMTP id
 71dfb90a1353d-56fa6542098mr3883427e0c.3.1776671190654; Mon, 20 Apr 2026
 00:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417140231.3972749-1-chris.brandt@renesas.com>
In-Reply-To: <20260417140231.3972749-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Apr 2026 09:46:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVCtzxumM6yniuGTKfqG_z6BuySHNcZYE9UHP5AuDoLw@mail.gmail.com>
X-Gm-Features: AQROBzBuq_XRHepFNQh1JPCL5m8jICz5bAQa5xeGTgiQQMKwx8PdJeiPrEwUY60
Message-ID: <CAMuHMdUVCtzxumM6yniuGTKfqG_z6BuySHNcZYE9UHP5AuDoLw@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: mipi_dsi: Fix return path on error
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Pavel Machek <pavel@nabladev.com>, Hugo Villeneuve <hugo@hugovil.com>, linux-renesas-soc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,nabladev.com,hugovil.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-31393-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: D7174427E15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Chris,

On Sat, 18 Apr 2026 at 14:49, Chris Brandt <chris.brandt@renesas.com> wrote:
> In case of error, we should unwind correctly.
>
> Fixes: 6f392f371650 ("drm: renesas: rz-du: Implement MIPI DSI host transfers")
> Suggested-by: Pavel Machek <pavel@nabladev.com>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -1476,8 +1476,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>
>         dsi->dcs_buf_virt = dma_alloc_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZE,
>                                                &dsi->dcs_buf_phys, GFP_KERNEL);
> -       if (!dsi->dcs_buf_virt)
> -               return -ENOMEM;
> +       if (!dsi->dcs_buf_virt) {
> +               ret = -ENOMEM;
> +               goto err_pm_disable;

Shouldn't you call mipi_dsi_host_unregister(&dsi->host) first?

> +       }
>
>         return 0;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

