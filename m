Return-Path: <linux-renesas-soc+bounces-31027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PnrHC111mlQFggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:33:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B303BE3D6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9E0230158BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 15:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4532727603A;
	Wed,  8 Apr 2026 15:32:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7941325CC79
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 15:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662366; cv=none; b=TLbaWxd3dJc4VadpOeiMaIeGOAHJLJ494JVZGi/42w2q/pqQYwbM+9cEs/PVLrwPzE4fUTvygbAvqxMUb8t+eU48zpcpbInXimKtLGb4hWWyMhxPkAiHEOOyBxy1jmXwW+T1kX2y5Ql3qKWZ8GR/tYj/lbXi88KE0A54kJKyL8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662366; c=relaxed/simple;
	bh=fLDogc+PfWLqtQUoeZcJk6/5Xz1/i/Ly6e2O6PfWY38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bpyy/IXeblp4E2jq+N5J2fCJ1vUSrBo6LJQAHvEyZyzd5SSSMRIIhZqcDej9bXGrBpw4xIaFDxlnpXzR9R8/DgF1Qaa4AmX8ORtks0Tzh7SHMx1NNFRxi16oM7cMGfEyse/W/vHimBKM37m9DF3TM8Hg8IlIE6AyV10iGK6BGik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56efdc96b05so1961158e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775662363; x=1776267163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKfetSVtF0E3HgLdI/IRyfdOCm4/lnz9KQsOg94GD6o=;
        b=dUk10lGTyyXpzszx2+Gkg1AzATwn/pTRfVPXVhZb1rnK+F+AAn6LzVKhRDxtq+pDJC
         H8EoRCie0GqkviioS6eOf/aNppQTv1Co6QX3tx5jbrCPmC5qFmVOCLGE8y7HQJ40a9Au
         B6pYeE2ohcPlyi6mOUh9XTPRXGwX4bTpjzgEP2uvWAxdkrxGXpHF6rQ2d4udJuF2kEZy
         3mnXXFkAeh7gXNf4lfrpVHSRcR3qv3h40kI/m0tzZi2nD62zKxZ1Z1pBrHEWr4liFVNj
         DrQeDZzGopOZuVJ+E9A4smWlGofm+p1D2l0W/xmE2Zh5YY6CH9/mNdKrsOlGzzdPj1Sz
         Bfpw==
X-Forwarded-Encrypted: i=1; AJvYcCXOumQ2L5e6Lu6RlEnfrPbVZTKFee1J+zuSZATu/KvEuqkSm7Jq3k/9HucgVv5cRqLtUkzCXaLMq1r1pevQ5n4W4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoDINGxszFTWJ4TtMWp4Rtaop0nGM8XkR4+hZ7v0p71pxnvT7c
	hMe0BKRYKQq4yK4l6RzDXHjmfv8vzHQ4mYoESqC49sHMzqcOac1ofNXO7u6t4lcy
X-Gm-Gg: AeBDietAc3Igg+wMPLM3PM2LSoJGfIeGZ8e51LiTKE6SrFaAik+gvYdkUG0Injtar+d
	1pKyzdURO+bkqQvRi4/ktsCav0AnMQgiKwJ88d4/6XHaoOrmQwwiIoBZ5jkUM4N+TLrdTvcilpo
	tcYDk6MQa+7vhoa3lCtuljZnOng4kIySKtOXy4i6PbCnp1Xhh9TCtPEimKhlLp1aeaFsJVz2wTP
	DFG9rrVcuhDWxnhQCIAhhfPMv9dg742tagOulnhlYw1yciG8IqpA4detQMet0Y+JVcbRgJmgXcb
	lsjomSJ/w8NXX/oDx25eZ8bfWDFRkjea+uTMMz3+UcsWt+JezexU0RHzRtRNU7lLCPle6iAtcmz
	sgXMg291060Uy3uMuWzx5qBf4cLt4SDhp1RZTq4sV7vfD7Z0WGc09RNuzIzBBsUpURsf0jFuvA2
	OqdU2fK/dzcVrPjvIsl6Z7bShRBFid/hKtdG9n2Qx3KR9JOIlvx83YByb6eiKMbodY
X-Received: by 2002:a05:6122:2886:b0:56c:e871:31a8 with SMTP id 71dfb90a1353d-56dab8a770cmr10387875e0c.7.1775662363334;
        Wed, 08 Apr 2026 08:32:43 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba80290sm20669937e0c.3.2026.04.08.08.32.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 08:32:42 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56739adfa1aso4761408e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:32:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwJoOuqEsUmEM/yrojrOIUXnoQCUMdWqCuuyBr5lg60Xo1wVZlh4EkXFpmU/hasbh7wPGoaWwfoh2/rlqXq+pW2g==@vger.kernel.org
X-Received: by 2002:a05:6122:3a1b:b0:567:4e8a:fb13 with SMTP id
 71dfb90a1353d-56dab8dcb70mr9824739e0c.8.1775662362609; Wed, 08 Apr 2026
 08:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403141341.2851926-1-claudiu.beznea.uj@bp.reneasas.com> <20260403141341.2851926-2-claudiu.beznea.uj@bp.reneasas.com>
In-Reply-To: <20260403141341.2851926-2-claudiu.beznea.uj@bp.reneasas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 17:32:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6mDo5epYW-OXmkMMPa98YL116DJDOwzDcQpE=Kjgd2w@mail.gmail.com>
X-Gm-Features: AQROBzAXLNIRJpEy3q2gF5nhVhPc-P_1GSE_7dklJN0Z1IMf0QdDnwPrqOTL6Do
Message-ID: <CAMuHMdX6mDo5epYW-OXmkMMPa98YL116DJDOwzDcQpE=Kjgd2w@mail.gmail.com>
Subject: Re: [PATCH 1/5] soc: renesas: r9a08g045-sysc: Move common code to a helper
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31027-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.303];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E5B303BE3D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Claudiu,

On Fri, 3 Apr 2026 at 16:13, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Move common code from rzg3s_regmap_{readable,writeable}_reg() to a
> helper and use it to avoid code duplication.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Unfortunately this increases generated code size by 40 bytes.  I tried
adding a "dev" parameter to rzg3s_regmap_readable_writeable_reg(), so
it can be used directly as rz_sysc_init_data.writeable_reg() callback,
but that didn't help. Oh well...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

