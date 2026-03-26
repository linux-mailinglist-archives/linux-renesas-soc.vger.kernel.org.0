Return-Path: <linux-renesas-soc+bounces-30351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDucBb86xWn/8AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:55:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A93F03365BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA16E307FA2E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 13:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6701B219A8D;
	Thu, 26 Mar 2026 13:53:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7BB13A3ED
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533187; cv=none; b=trVmjwq932jdvGT5OyV8ocp17zpukqzpthydejDxJaTLkeJqhsIZIQVgFYOPnNlm8+2W78GEPBVWuS5o1AXURtu3jnVgmbh31+U6L0vhIdOYrDfT3m0+WMPPVoMGc8UGpbdcLpK1DDKspDqp8YPD6fekrKYsDWKa3pWXVqKFatY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533187; c=relaxed/simple;
	bh=allQBDylsyvzy4b7xxKpxg8YGaT7Ugf2jj4J2mTkWYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z7T2IHVzOtrfejXp/DybzGBcaCQhOE0EBn80cxCyXYtywhA0gZbUtR0pnqwTNJMC8N/wWt7qDPEytuw1WEtjVAPRxJ8yccpU3vsbFbhDdCDUK0Y5HeBSlD7OQIW3C1ayh0oBRyKBGoTapS15MRdiKfGX8xlNg/EUw7qhelpqWEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6031949debbso301468137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533185; x=1775137985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzDnEVQxVZBWv38ze2fiTQpDojNrY7cSugpZCyxYmAI=;
        b=gWyZMrO/20KfjzIq/NRFmbaKEpzMahPHJxTyOrC7a8ToIDSY81pdG1yhSrE9n4/IVz
         HEuRES+KwGPVk0OKLpEijYRLeqqulu3Gu84lirI+46GfhlIlKP99K93mE79iYG7DxFlP
         LGV699QcoY766p1ZYXX5uioEOQXqNTm2s95teOvLUL4E8JWejeNkjbBai/DhbsdKRNX3
         sRaM0K7zXLCVLsp7P1dt8T+7BoPacBzBu7mrp2uX3y1IqWsp41nLc2SM7FWtyyvlySO/
         ZM/SYCiZf1/63mk2f7xYeHjpt7np3q37/l7ory/HDoLUlj64yKzA4d8LvW93dFnGPVdl
         8B3g==
X-Forwarded-Encrypted: i=1; AJvYcCWxQvQcBgLEshFCayck8MQv0I4StHJXEXXcvRX5xL2vnq87/9b1sNobkk0dLQtDHlonUJy/lpxc+9AfHNy2d4covw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4g64/Nsj7O+8yb8pHTLheTd/yreT5m0TY2bjp1SbHTXibG6Mp
	S50G9q9S3s9hjeAyCABry7ehbxcFPjfAzG8ggnqA8HYmwnzAGx3uH3hBR7Tr7czOyYk=
X-Gm-Gg: ATEYQzzoLlTpocCngxw2F3I+We5Ob64mOtcfqI5RYJNUgVVJVCfYkPcPLJoILW4UjH6
	COg3NI+n4oL1JgRe/jExwSkqpUJjSpwEOA8kKw5D8ni6xhewRm2jStNP4f2jP+60MCe+I7UkIfs
	ZdrjPynh2pd5e2ZwZU2dNB+B7q6/oGkpCQMtsiZBH+5Fl9/xbyuAL+SMQ1sLlW2D9Y3WEUoga2B
	ZvVNGZW6uffgBeG9+Zcq/r5uOZMnK8GBHJn9ovJN/Ug9lWFOVml2O7toNt2El0zJLUE7GdpiBkt
	+omTupOMqcBSR6A9LBdTxcwPqAY8U3vXv4Hq+8q+oU9WSLyBrh2Jfu7gDWMsvyLwOPRWs7iUYbY
	Ev2Bsem4oAjZcxJ6RdwdvdtOz3E2HUgZGyqD1IBGw4oJ56+TWMjjErdT7FwcTI4N2a9WSlLaua0
	9wcU24uRScyIB1DqPM22/zmh4YXcj+pJ6QjACg1qf1lUXwDhECTDS2PPQk0+wAuTGl
X-Received: by 2002:a05:6102:4426:b0:5fd:fc84:4b0 with SMTP id ada2fe7eead31-6039481aa34mr3709201137.35.1774533185011;
        Thu, 26 Mar 2026 06:53:05 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d53132bdsm3177757137.7.2026.03.26.06.53.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:53:04 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56b8804f37cso493240e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:53:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXASuWAVftaZOA9EYr1jKf7jtj16EkXEvZorPUpUFbFExYQsugIs0yCzRwBta8HUQJpzwti7c58vVOP+c/98R+mVw==@vger.kernel.org
X-Received: by 2002:a05:6123:4c:b0:56a:f542:78fb with SMTP id
 71dfb90a1353d-56d21f80b13mr3741795e0c.7.1774533184311; Thu, 26 Mar 2026
 06:53:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:52:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtXg0q3UCfMQO3sEkp82RfkQZcwrqELjmUXZEV5jF90A@mail.gmail.com>
X-Gm-Features: AQROBzAJ0G4WwA5tQ6aWRHSEvyPd9w-wMcCONronZM5uNnqB1m99PkPK2EgZJI0
Message-ID: <CAMuHMdVtXg0q3UCfMQO3sEkp82RfkQZcwrqELjmUXZEV5jF90A@mail.gmail.com>
Subject: Re: [PATCH v8 06/11] clk: renesas: rzg2l-cpg: Re-enable critical
 module clocks during resume
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30351-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid,glider.be:email,renesas.com:email]
X-Rspamd-Queue-Id: A93F03365BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> After a suspend/resume cycle, critical module clocks (CLK_IS_CRITICAL) may
> be left disabled as there is no owning driver to restore them, unlike
> regular clocks.
> Add rzg2l_mod_enable_crit_clock_init_mstop() which walks all module clocks
> on resume, re-enables any critical clock found disabled, and then restores
> the MSTOP state for clocks that have one via the existing helper. This
> replaces the direct call to rzg2l_mod_clock_init_mstop() in
> rzg2l_cpg_resume(), preserving the correct clock-before-MSTOP restore
> ordering.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7->v8:
>  * Updated comment in rzg2l_mod_clock_init_mstop_helper() as resume()
>    calls this function.
>  * To avoid setting module state twice and also not to update the initial
>    mstop state for the critical clocks state during probe, replaced
>    rzg2l_mod_clock_endisable()->rzg2l_mod_clock_endisable_helper().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

