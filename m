Return-Path: <linux-renesas-soc+bounces-31030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKGUJyV21mlQFggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:37:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D77703BE49C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 422C030570C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 15:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BFB3B0AE8;
	Wed,  8 Apr 2026 15:34:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF8D3AEF3A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662442; cv=none; b=e8KfZ7LuHrCX070JqWMctY7djGm0Wxnh5huyqF4PbOqRIBoNRldO3TEP4yqrItt3j9l9H16j/9hIa5toG8ZM1zlcjdr9IVqhHv9B5rLQshJLJsFUjReRC6iwma7cABaavazx0q6yxYRkIJNC7JUQoWVoriXAW3I3ErbM3mAZGvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662442; c=relaxed/simple;
	bh=W5VUVZL/gYfGC6iSx9IIGNe5GUdcrcPO9p91ZRWJe5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hF+uG1yupQZTsm+3rWfMYfdD8vJ8CASh2C/dV8zwc9Jqne4HP4xc+gvPxd6SlkJDV7dDEdQCcbABcJ0yotZNYzKla8IJ/C5DLEWnxQMi5PPx9aw+nyluC4PFWI/SWC/tVFizXbba2seO3XQQHqtO/S2InLxJ2pHKKdriRYv1ULg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso1892787241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775662438; x=1776267238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kP/GYWLAED2YLI0lkSbL+FzZMivRvRnyBQ03pTjYj0Y=;
        b=Z+EWVEII79pyX9upa4UG+Md5YWt8TkbyGq2mp5NWTpHBhJcVpD+rWlH4G1LHVzTf0j
         UkCms5GN9TPuz6Xg1SUKnnSJIPqWq1AohsM5J229oLVsl9Z0xqvNRBl2yWppZu3FISyA
         qeJcqsHGlP8X4sPmVsZHvMwJlMpKXKOjIp3AvuxVyDfQIVQFdChvG6csrhmrJ73do+8X
         ZKbD0DXxEOprblXDfwz5xsYfAIHLxAOQU3z5n8M98dv++pmUKydjjezYNUlKWtk63pPS
         CLDu+O1UGeKLcBnzJmvvp1sLN0QgsQYP7XoQfgx6aN+Vvh/xbEPoJtm3jgX7cllduP+S
         qN6A==
X-Forwarded-Encrypted: i=1; AJvYcCW8gMYoig4dJdC1dHKO64n0XvM9TE0lJortXOhukQVt0BKyIAuuXGhu4tVemzXyALsppoMeVZCMCJ+pZ4K8QCxlTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzY2PP02cxgl78iQMFVuhpX5gTgB+JdnfuOptBTaOM5CUxQ2Vtf
	p9i6ukqI5/ytsVlmr2UVRr98NMc/b8sHdzLt6S+3vuHgbxrLydQT9dTCAIbtRwIr
X-Gm-Gg: AeBDieuqUZheVGJ+idg1cvKKsr2Hk+6grsTmqRzL40y8kxMeIZfZQ4pVXjI/pVxlW8p
	HCfmm7NThPc23ZENigytwBl8WyN2xQEpOu55fl+xYBQ6/x8skjJ0FBW/QLc9IoBhQzgplAMHKy/
	gzRp2V06Qc6U0tvgfzHDJ2RgmsPnPWW+e/vbBCRRvA2F/zomu7IpCy3mdqXtL1nF86R44swDhM1
	SpUqf2lF3n0O0ra5Xzom2HZWf+RtUtppbsGYQXv5zFya56TM/mxWZkeRwwCSCeeN2OT36j7Pxe3
	VIJ2NPNfBnZYCGkEs6p/A/utS3FhZ47WZBXbeccmpFdyEVF4HdmfU8ZuhLdyGhYKHU9zdRXQLGg
	vQgAIixnq4W+4fg39yzi7QwC+Ps8wBJOdGUrTF13fiIfQE/pBC4BGyZf3fCth1jIgtdC19hzTUy
	w/aVEQzpaNMVB5fqb7rBZSuW9bPbc6nR7hqNt0yQgztLftGfrNoBGlBPhvmNK39eHVpxGgmL0=
X-Received: by 2002:a05:6102:e07:b0:608:186e:e92d with SMTP id ada2fe7eead31-608186eea2cmr709162137.25.1775662437897;
        Wed, 08 Apr 2026 08:33:57 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9b8d22b4sm20596475e0c.0.2026.04.08.08.33.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 08:33:57 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso1892779241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:33:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiYUR3u1s0B6/uewwFBNJ5SXBFKQZ2zPGgWmoJ36HCjyfw3DYcKxRj/F+av09tHjzWhSGJs7NrRZaGa/GuFB7thg==@vger.kernel.org
X-Received: by 2002:a05:6102:cd2:b0:5ff:ea33:2c0 with SMTP id
 ada2fe7eead31-605a51bc9a9mr7469116137.33.1775662437187; Wed, 08 Apr 2026
 08:33:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403141341.2851926-1-claudiu.beznea.uj@bp.reneasas.com> <20260403141341.2851926-5-claudiu.beznea.uj@bp.reneasas.com>
In-Reply-To: <20260403141341.2851926-5-claudiu.beznea.uj@bp.reneasas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 17:33:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXGFwA1iwxg4M0QpgG-AV-isji-RHsG0jL9CYNoWC9DyA@mail.gmail.com>
X-Gm-Features: AQROBzBQ4Qs3c5UuUnlvsHw5Wv4YEtDs26vI6z2rW6XmGA-ZXs83qMgGqDrahGQ
Message-ID: <CAMuHMdXGFwA1iwxg4M0QpgG-AV-isji-RHsG0jL9CYNoWC9DyA@mail.gmail.com>
Subject: Re: [PATCH 4/5] soc: renesas: r9a09g056-sys: Move common code to a helper
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31030-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.248];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tuxon.dev:email,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D77703BE49C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 3 Apr 2026 at 16:13, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Move common code from rzv2n_regmap_{readable,writeable}_reg() to a
> helper and use it to avoid code duplication.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

