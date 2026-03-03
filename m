Return-Path: <linux-renesas-soc+bounces-28689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMSKGyiZpmltRgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 09:17:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E101EAAD4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 09:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 888C6303454B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 08:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A5431F98F;
	Tue,  3 Mar 2026 08:15:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A4B38C2DD
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 08:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525714; cv=none; b=RDNh9w0rqAVHEowubPBvLLpBpuMWZbzQ77gEOT3WxAZVs9Xr0QmXcBXIhocec2OsQWKKSqeEwZ1GnldPtAdvKbtKhX50rAnCNxq04vUqe18f9PR7nr8jwxPBov0JWEgPss2picrwpRcnp++7N7oYovZLtiMAYkAO/JDTvatBf1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525714; c=relaxed/simple;
	bh=O4InMht5UqZd4IT0aHOECjfcVSSYEWSwCkHGFfBOdBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtRuES0uu98MZHIaRf5L6hkj6ak1n84b8pIl+7PdSUUaX8yTc6OWKS+cSBl9loNdK+sf6FWWBKWXvN9vbGBXWMmdK1eSUzkvqpW8tmUtzTvI6+smdXxD4N1yTuCTmlqQbyE9pte4/VJIzHZoUuWuzjuoh7dN52b6J8iGvPu6zLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a8395a68bso2536558e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 00:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772525705; x=1773130505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baIVfZQL5mR/z7ZDL+omelyIyuKMeJSDP1yp3gkoZFE=;
        b=OgrJH5pfalULTvA7PyadAaN6HcIdF/Vx2fGrQAmWxwdAjS+dwGTqvLKoyDeckJJlAE
         /8UL3mlS4ZoR89kPYHvkVBVjPV0rakfE08Trt2v5u7xKGHERqQ+rVd1pCqwNI6czVWSv
         dlINythZUfbGpfG4AWe/0GucLP5EdBapRE5ABfyndo01fcjeUskXcSrWUA3QDFr6X76c
         nJ3tRcAs1D4DbOFQl05Pff/8OaLPF7QTH0SKd7WbEsSp1ZX91Lb8qZgCaOOjjbr4HZwo
         VRxVfwiGg0lokcPZ1VpkVoLlEDx7EYR8W23Xz7pzGEsEdh6J1WyG/I1z1RXXx5B8Grsw
         vxIg==
X-Forwarded-Encrypted: i=1; AJvYcCWlj7PsU5CgydKa3ZCxqLGqGASAyDDbJgViRie7zlaSKQcfh6HEXm2wtmCqA9Q2Ldf/JvbkA+th0kqe4L+P0jGd4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGqHuoVYbAusDqm5ttu2uI41pgd3M53tRAo2Ggx+XUXg9w3U9p
	tcglgaiGbdI1oOa6TN7mIkcBrNZRUpt3g3LzPZwAmOQCfzj/dSVnq+NofBbo5s3L
X-Gm-Gg: ATEYQzxP9cPGYyVKmz8Fj8F1l38b6Qb1e6OgP4yGfQbClMdlKZ/fl+/dx3YDY3Qoi8T
	RORbNlbP1PgQO+pJkmM8+BkfiphUU1qpDg0yEP46gfN+ac+2VziFOvotu80SDkYIpEJpO0g7WZm
	NbH2AKkuLFqiotxF5ENpjf0lo05L+VmtmenUSIA4AjSwxCTukvSzCKO9s2w8fZ2N/OkGGAQNj37
	SvJpv67wOthlzvYxNvuqbbAm0aXAeZbvb9YGaziKTycqUpozQQxyqxmN8SONfLaEy03sxO+qDGf
	qOTxdTPuHe3cHqhy0G4//8iEQ2TQHB2vRqPCYnPZHYZgkCml9v00VnbL4jrbe42dGZETkbnheSa
	ORqnzevVtQ6SqGUAzjTP2Y/+hLxzNobO6/DhRRkR7bkhlQlXcV79icvnOsOT7jdxuEmKuq7abXt
	K8uGlRZ/qlluDY3JalezbPZoOtReMnB6yERo/unt6tlnS4dOEB4H2tUdBOvik7
X-Received: by 2002:a05:6102:3583:b0:5de:8933:9d0f with SMTP id ada2fe7eead31-5ff322f5490mr5131858137.9.1772525705380;
        Tue, 03 Mar 2026 00:15:05 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e808164sm16031317137.4.2026.03.03.00.15.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 00:15:04 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ff196450c6so1473826137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 00:15:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVp0p8uylNonwI6EZabdAM5usEptH7C2pr6ibBA40e2q6SLjVHLMbNVXgNV22xle/j9PNC8G0oFTF5Fy+58w7uu0g==@vger.kernel.org
X-Received: by 2002:a05:6102:508f:b0:5db:cba0:941 with SMTP id
 ada2fe7eead31-5ff325870f6mr6153888137.38.1772525704432; Tue, 03 Mar 2026
 00:15:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org> <20260303-uppish-finicky-mustang-cd135f@houat>
In-Reply-To: <20260303-uppish-finicky-mustang-cd135f@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 09:14:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4HwgwiBJFkA43MpYWOScG8n7p4p3_KBL+Cg3_P_a18w@mail.gmail.com>
X-Gm-Features: AaiRm52aGiAdtZAUmev5KOPqlNFWQU8B725pPLRxm8mb5akJev06moWAe8DIoF0
Message-ID: <CAMuHMdW4HwgwiBJFkA43MpYWOScG8n7p4p3_KBL+Cg3_P_a18w@mail.gmail.com>
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
To: Maxime Ripard <mripard@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, dri-devel@lists.freedesktop.org, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C6E101EAAD4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,lists.freedesktop.org,gmail.com,linux.intel.com,ffwll.ch,suse.de,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-28689-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.615];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,linux-m68k.org:email,mailbox.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Maxime,

On Tue, 3 Mar 2026 at 09:07, Maxime Ripard <mripard@kernel.org> wrote:
> On Thu, Jan 15, 2026 at 03:45:53AM +0100, Marek Vasut wrote:
> > Update drm_of_get_data_lanes_count_ep() return value documentation
> > to match the drm_of_get_data_lanes_count() return value documentation.
> > The drm_of_get_data_lanes_count_ep() is only a wrapper around the
> > drm_of_get_data_lanes_count() and therefore returns the same error
> > codes.
> >
> > Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and drm_of_get_data_lanes_ep")
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> > --- a/drivers/gpu/drm/drm_of.c
> > +++ b/drivers/gpu/drm/drm_of.c
> > @@ -539,8 +539,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count);
> >   *
> >   * Return:
> >   * * min..max - positive integer count of "data-lanes" elements
> > - * * -EINVAL - the "data-mapping" property is unsupported
> > - * * -ENODEV - the "data-mapping" property is missing
> > + * * -ve - the "data-lanes" property is missing or invalid
>
> I have no idea what "ve" means in that context. We should rephrase or
> pick something more obvious.

"-ve" = negative, "+ve" = positive.

git grep "\s[-+]ve\>"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

