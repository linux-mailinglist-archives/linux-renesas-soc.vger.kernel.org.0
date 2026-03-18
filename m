Return-Path: <linux-renesas-soc+bounces-29801-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFfaBC3aummfcgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29801-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:00:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 437FD2BFCC1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29A823550F31
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 16:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D972F6170;
	Wed, 18 Mar 2026 16:32:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0400A345CAA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 16:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851547; cv=none; b=dX2dU5bZrosCGb7lRhwGUQ9rTr8i1ffhaJQAdaMlZmn6PDQelBHy44xF9Vqv8nI/IiUl2wEluyzdw1nBVAYH6bp12H+qNE9o0YlaqN5nzhOoSMSWA/eLzYf3LUTtOBdy+d34nRwylvbvOsvzGV7Ntmd9uEF/pzJ6LHRRRL4EOvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851547; c=relaxed/simple;
	bh=J9AoQJqhss2LsfIv36b73QdQdOLW9HvVXjRl/JvP07g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QQuXbAyKdy6I8B9V7Oo5y890Ke2HnoHQ75aYXpdM6WAsBT63BoWm20vC/2rQQkvnjgbucF7F/4MiRsjRcGcm5L/HVgVV3IyIYCJkBXNLrkuPuz9Ow5daszHZICJQ7f04h97dPnNEZbuIK8rYci6i596UbEm9bq4MlT1gwqEolzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ad9a9be502so16975ad.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 09:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773851544; x=1774456344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyAgld3HIOm1wYub494sLGOg4YlSEABoZlx1Bb+ypLQ=;
        b=Wvz/xW1YY59R8P4ugTv1DTN5HJmPZfgrktkwM8ZIklNS+nSm0e4I5Mqt3iKjRBCOZI
         APHFnosTPT0iIjOIY7+fIo/0wUekh0Tnm2aud/ucHH8rLHHanG65XQZ3MYHp8awiwD7k
         aiLHczuHgm+VfJrG9cOU8FUHPo85KIfbgDzG9tAFWsKlGSmXLUulYpnWxp3gkAqLkSlv
         DqglzrPM2as0lQ/0kb8zPtERMD2S/gbo/FSDS/yzdw21rfKQJdO4N5lEAx+xQUELCCZA
         QaCA13rn86UIxnGn37OLHVdB32tzauOOKqYIfOEmOdcJj2RSsU6OTl7e1AZAGRmM7yFP
         J8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWL0xyHvjhXONuHpMZl5j2Z5syh3yfpNWo6s+uxS4kHeZp6vzrRVbEfDddPFocRVpRkwmGP8rqav7RO5TfbHyipng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU0+H8w11P2Al+NvmmoiFyGEpx7vqfv9EchZwI7r7d0yuiVYPQ
	jVW3G7TSobS8wIhXsvLEdVE/77uvNzLxtb76oT46Fbd00U4XLukHq/sRXMFi47EiBDg=
X-Gm-Gg: ATEYQzxEapt+D8L1hgypEMIZx9wTYtIRLXgTOZQcD46UoWWCbHRF37bBxG8HMFe58h/
	I9sUKYdlhwBL/xLooNcxCJXN/skiAWbHGBIzGg+Znf+uBv1Q9QZhuLwW+HTgRScgbr3WRTjJfFe
	QTruERTBQ54kSm+39PjB1OA6YRSj4lydatcRW1LY6GN0NGK7V26n7VRqHDE/QN8OzljP5FZw2y1
	3Qn/VesvEfqH+eaCZdWG1I26K62/d2ZJfLPQ0jmAK5tXCPQw7QllTbJflo+Oab+6YbNLxNMRuzf
	EU54DQn5hqr5nGIsh9qiHLRerKzYFh5/qcJBMLGPhG2o//HXF2MlrNEssNMIDwngVobi+3BCLiL
	UvkLbEAOEgp6Ama17HPWrBp5kLQiYX35pVbGwKpAantKCOn3XkCLw0bOIADZye6EWPfJ3aiDj4z
	kkq4tle60WJHxW2fM8zun4E2R4RHRrVW33IKTy+OvOaUbJRpEkRHxgkzU4WnI3vvWv
X-Received: by 2002:a17:903:3510:b0:2b0:5a4c:7263 with SMTP id d9443c01a7336-2b06e34804dmr36116235ad.18.1773851543845;
        Wed, 18 Mar 2026 09:32:23 -0700 (PDT)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com. [209.85.210.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603942sm33553235ad.56.2026.03.18.09.32.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 09:32:23 -0700 (PDT)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-829afe24fb5so107941b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 09:32:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/vcR8woGExLiunrwRWUFgvew2gSSpYBriiDEom97dOfy159pm+dstWApx7Lzn2C3Dn5q4JAdVnntC6BVgnOjWtQ==@vger.kernel.org
X-Received: by 2002:a05:6102:374a:b0:5f5:4055:4558 with SMTP id
 ada2fe7eead31-6027d0b9ec5mr1976763137.2.1773851098056; Wed, 18 Mar 2026
 09:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com> <f6b43f0dc64e13b1c9942c164dea30002d4c4466.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <f6b43f0dc64e13b1c9942c164dea30002d4c4466.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 17:24:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW+d8_SCBtRH3St2SBWKND1Q=vtcK48C6i9PyQZbjs9Zg@mail.gmail.com>
X-Gm-Features: AaiRm50_PfHsI_l0RjZzNnYxExZrNf0xwI7nlPt_QmbbgWorEasSrObC0tCBcTk
Message-ID: <CAMuHMdW+d8_SCBtRH3St2SBWKND1Q=vtcK48C6i9PyQZbjs9Zg@mail.gmail.com>
Subject: Re: [PATCH 3/5] spi: dt-bindings: renesas,rzv2h-rspi: Document RZ/G3E
 SoC support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29801-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.388];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 437FD2BFCC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Feb 2026 at 17:25, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Document the RSPI controller on the Renesas RZ/G3E SoC. The block is
> compatible with the RSPI implementation found on the RZ/V2H(P) family.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  - This patch depend up on [0]
>  - [0] https://lore.kernel.org/all/20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com/

The dependency is now in spi/for-next.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

