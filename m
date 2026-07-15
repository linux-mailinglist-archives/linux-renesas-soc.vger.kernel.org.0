Return-Path: <linux-renesas-soc+bounces-35244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id skJ9NOpNV2rIIwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 11:07:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4941975C3D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 11:07:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82157326BA6B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 08:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05AF3D9556;
	Wed, 15 Jul 2026 08:58:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BFE3D9020
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 08:58:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105934; cv=none; b=dzh/+OA6FGOn2eECz1MMmqwy7XmS/169n9TwWMw5CSja9BtjNn8irULZnC1Nc/RW0gtxBG911x9IGFhq1afYu9kxyoWBz3iRO0bIVx7p3j/+oxnikD7fkwgwaXIdj5U+dncMUH5iSbzrHny9dYalCu2QMd6IuyzfcNYQyCTxqSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105934; c=relaxed/simple;
	bh=cd7DBG096VF7/MN3QhC9fHqLP5wSJXhCQl8cwkt8dzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNu4sF0emt2vJwTWUvydroakJ+ZK0YwvmWEXwN9Ag7Sr4M2NFLguFEiVcH/rdMliKFtkSQOf47LLi1oO1u1dPPXSm4G9fhmFmcP+yx4VC5bLJk9Xt9i8m0pOOjxooYExRLObYkPVCvJW8b9flbkd5gt4cTpcjLbr29ouguuv4pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c11f9015d8so355988e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 01:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105930; x=1784710730;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Em+8fgb0ygi1i2LhSV0Cm1ShdIUU1QDIn9O8w7QaQ/k=;
        b=qTY7RdEUSvQIDJeEH8nftTpBcY93tf5O4z+cawreSmy28xxfCKAwbim8B7f3qsBynr
         IObc3o0nb9/ymyD55CGukvtRKVyRDDA7B3nPhpuhunGIDRIpkZLtHPxQmoX5uW7pEeLP
         peXlVwb4zTioGp5cpFXXcOkYUJkdCuPE2zBNrOG1DsqCwsfOb4k6FyELkYMfe/lr3g05
         dauQqDwdoWJ7THDGNFDj6V+xQ9kR+mS1LS7W0t2eLkQVuUGVDBQOr53yAqkHU4nIfKbk
         nCi+sqwDtSCSiivxFp2pqHBQov9VT+ImVR9Cnt8/ZkRJGbePKa83KQ+jN+gMvW7Zee00
         B7fA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9NjuaBlG/Moh6M5qo1tcgWMZUEzVsR6vLf+Vo4V+aw7a1bs+KZvKNEscvn44XBkpsBHJmmf4q04YnJNAGPODGYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUVCkpm6uRuaDA0Xk7mgO7kwuFGVke1r/QuhV+atgBu9+JuvNI
	Dhw5HGyaWnJTwvU9B3JbwoYD34wv1xJLZuZHIQxUBg7wfNQYW3B/DUCgszj2guHBDeg=
X-Gm-Gg: AfdE7cmgKRUnVLqt/XDpe3GsaVAlyIWVrZRl0DMyUXIdzPla+J1J61IqsEKknVqL5nq
	CI7FThIgVDbvZcdulUpwU8NhXbox+O4or8XH/M8tzv0/uJ+22ido2Mu21BY65/dxlkwVxHGIQVD
	2xzqGxpIhvqwjLEIuOrsXa4jr6z2PVDI4/YFQAyvEnpEnA6XMGWTfVbY/IITL57X4buc6LJeSOK
	DMaKW5XTcU1/O2nfIULURHWy8OCLKgdlv3AUtP/Nj1BRDeSdEJK3oJGEhWuTVRigDJbu37LwTt9
	9JeQ60/22sLTCw5riZ1zGJZEhmTf1tIaRD5cU1YZgdiIS5HqQxCjsb1mtrvzhc7o5DKJVeiTNHd
	LXqHcdyEMRFheaiUpmBkTHHUHJkTcrMWT45FtzmI8fMdmOJ4nUyf5S0L43S859M3aqPrtuCNYzi
	R94bg7JxcUqhhG20mJ+PvdEAkPHo+5HbMF5XEs5vMzQXYHWuG6NA==
X-Received: by 2002:a05:6122:6d03:b0:5c1:1965:6243 with SMTP id 71dfb90a1353d-5c119656533mr2650048e0c.13.1784105930441;
        Wed, 15 Jul 2026 01:58:50 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f5e2e70sm13676466e0c.3.2026.07.15.01.58.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 01:58:50 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9690c99c917so1605459241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 01:58:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro34B6SweGysXqbPfDqcFEFAzcb1lnroVhXTLy+jaEX3IqWqqeULzhJvckZHcSYAXb7MYfV/7SZtUcy34EjX4+T/w==@vger.kernel.org
X-Received: by 2002:a05:6122:82a9:b0:576:c4b:460a with SMTP id
 71dfb90a1353d-5c10ed0389fmr3961224e0c.8.1784105930097; Wed, 15 Jul 2026
 01:58:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 10:58:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgvwjb7zNnsRXX9AzaUVAhVmks4yU5P+pJ0in6NyA+ww@mail.gmail.com>
X-Gm-Features: AUfX_myYPtAhsLzqsMqdAVX_MCR49rN5A1iR-oDlp3d9aq2XNRWC9ufPlL95oJQ
Message-ID: <CAMuHMdUgvwjb7zNnsRXX9AzaUVAhVmks4yU5P+pJ0in6NyA+ww@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] clk: r9a08g045-cpg: Add clocks and resets for CAN-FD
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35244-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea+renesas@tuxon.dev,m:mkl@pengutronix.de,m:mailhol@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-can@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,glider.be,gmail.com,baylibre.com,redhat.com,bp.renesas.com,renesas.com,tuxon.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email,vger.kernel.org:from_smtp,linux-m68k.org:email,linux-m68k.org:from_mime,tuxon.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4941975C3D9

Hi Claudiu,

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Renesas RZ/G3S SoC has a CAN-FD IP. Add clocks and resets for it.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - none

No need to resend applied patches.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

