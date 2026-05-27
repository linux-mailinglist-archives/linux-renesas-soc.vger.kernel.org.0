Return-Path: <linux-renesas-soc+bounces-33197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJEXFSe7FmqHqQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 11:36:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF185E1DF9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 11:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 613F4302810D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 09:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4093B3E5583;
	Wed, 27 May 2026 09:36:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC62E175A60
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 09:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779874571; cv=none; b=kAyJzXcnhAVicQGM73OV0P3TrDnPPaAlpFahvo19uoSMUIs3F+FmyKQyNTTUsDKSSCt3QIXped8yd2YP5cVLyAQlXFOMPD3zXhna5+Au5DpZ9Vmg6iEKGNOwzSpWAEY9/tY+1hw6X5Jvbq/nZGaZH5v8S0Ys0F/gHnu5mjxalCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779874571; c=relaxed/simple;
	bh=zj+g/ezhAtLOdlP5pufwUVnlw/mx7Nw1tJEnvJe2s7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o1ymFJqUPmP+ihiq7Ii0DPg190oyRzRuEkVFynVH7sKy4jp6Op2vrNvLD2QhoCmy+WF2H/LlkbRrqkHNJEUoFzrWmAflF52LSE8LwGmxqTNMTU6gaSPtVNPgSadFpWi6tDRksZkPtLiMy9D3xEAKnHm4u0VTvIrpAz+GnrMob/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-58d2174a2b4so1487402e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 02:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779874569; x=1780479369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzrbtAIhbhlWL39MAGAjbHYV9tAMPrYxV5QryhtJx1s=;
        b=e6cyD+3WDWYBLx8lEwYIzu/nhP9PbSo7CWpY66X6XhVzvTjPn1R/z3RfplDw7c+qLY
         eVl3EZ8hnuCeUTeC4nGq3fJx3q9anpWE+QVY7vIIxuyhvwTW5O2h4a73sWV4zZgQfaUl
         7g4wCOiAouaqgv8p18vlCQhx/HclaZAGoUhCNIHmOXIkiW2AgxzrH1jC9hCgsm9kyYh+
         Gea8L+IBFT7FBFPFpakRJCZFQdMcmH6sQYSS0An/DF58dRK1LzBu1sGtkEMnhbn2V3fa
         nBri45H2mDyU5kA2Evn4WvBaGI64/8X9inB7YosGRIX3aIAg7R83G25LvGPA8CJy92cS
         y9uw==
X-Forwarded-Encrypted: i=1; AFNElJ88K8rz6uwXRP2UiOV7hSnvyPoph40Swz7kewunmBfeysb49pSsRCEzFrqnoEUlfMOLM4aHflJdANJTeM4sCQxWJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxagLeW2N+MqHtX39d+rg96VK/fJHzQRqGjhmuQsgrSyAwOrDAJ
	CRK+NJo16CrL2R89VCTHkdWy5XjUXTlP0qZIcmLxMkGLVhugYXuDY5DFCh0JUxYTK8o=
X-Gm-Gg: Acq92OGvbYSoo1blwI4s3lzY4fvV59k85kXeG6n8GqI5nBph4lhDHoT4r5vsBrOkuMJ
	kzoIhTtmBe2y1u1ptHaI9GVEUE7Pd+VWyB13RSBFnjJY4ddSPKaBlCLSrOdfCsI0hh7iGq/X/MT
	t9SiSKVUxBIGGhP7wuMFJD8I/1ACY8vU+5ruVa4DFcEUUOUDt+PWBmd9Pnjq+TOQZrzcORALU2W
	H0YlUlQRU7Hsu8NXCOWgfLajhQZ6ubPW2ZMfBgP8DOdHQROkIxb5K0rf6IS7q/SHzPZXObka2jQ
	/zRDlD2nmbtqM73si9ynj+ZhdE7otgjxukfhfeBmNFyNaJocbCOlqiQ0MEh35Tup78VwzqMGN6I
	x8HDsJ4kT+BdDxM9tFuPdra9LCe1wuDojjc83mfJaIkn7tABSFgBlHp5wCLuriE1z0oeqL/pBzK
	dCTmeZqmKggM80L5crcfcap3K/HhRc3AKgRdbQZFiZsaAtC9zVAmm6DlOipjowOE66ALwU/EKKT
	vc=
X-Received: by 2002:a05:6122:4d0d:b0:575:3b9e:db3e with SMTP id 71dfb90a1353d-5865d70cb8amr11848378e0c.1.1779874568857;
        Wed, 27 May 2026 02:36:08 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f85bde2fsm19477891e0c.13.2026.05.27.02.36.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 02:36:08 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5751e12c524so4005339e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 02:36:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9lgSWNoGfM1KlY5E5kDmczvv9kpeMYwL/mBMnFcXgsGa5Z5o1wphiJaxy1ju9ZW2SW+ICm/XITFiLya2U7ZnxMig==@vger.kernel.org
X-Received: by 2002:a05:6122:247:b0:577:501b:a668 with SMTP id
 71dfb90a1353d-586616414f1mr10121604e0c.10.1779874567993; Wed, 27 May 2026
 02:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org> <20260522102251.1723392-4-claudiu.beznea@kernel.org>
In-Reply-To: <20260522102251.1723392-4-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 11:35:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdrtRvefgvSZdM-Ek5At6gi-wRsi-9hqefoa4ij6meKQ@mail.gmail.com>
X-Gm-Features: AVHnY4LW6vUstLwsIKPkIzpK5RB63flO6CC_KxPAXPEps2GwX01GBBQiIwPKpZg
Message-ID: <CAMuHMdUdrtRvefgvSZdM-Ek5At6gi-wRsi-9hqefoa4ij6meKQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] pinctrl: renesas: rzg2l: Keep member documentation aligned
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, wsa+renesas@sang-engineering.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sang-engineering.com,tuxon.dev,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-33197-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.944];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,linux-m68k.org:email,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BDF185E1DF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 22 May 2026 at 12:23, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Keep the documentation for struct rzg2l_pinctrl_reg_cache members aligned
> with the struct member order.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

