Return-Path: <linux-renesas-soc+bounces-31930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMWSD15d+GnatQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 10:48:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 390334BA7E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 10:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66A36300869E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 08:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5542134B1AD;
	Mon,  4 May 2026 08:47:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A57345CBE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 08:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777884471; cv=none; b=caRN8SyaDNri3P8QjyJs2lKYV3D11U0axaHqV387mIoerm+ZQ/mFeH0t/SF2rJIl60EhRdc4BklF3AiGsAdoo1Gk0ypMj8+bZznJbuL+5T8zFeL0wQ1E98G+2PGoBg/7QKyqPWHtE8f7F9w/vbvzIvW4mZV4deKDiR/9rCJYG2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777884471; c=relaxed/simple;
	bh=9ThezaybU6JMwgX8EqkJ2e4UKZQQL7Vuu4i/Sg0xHEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8aI0IZ4mhfXJmqgjwfreb9gw1mQ3B/jUUbq1+Lq2qNmHX5jRmKMiw7rAcrDK15rcgEr6ydIQNcKcAqKml7xoTSkkZeb3rF/7LNnX0g+HStbBgY5NIqvUlqHj17Jr9KkZgyIrqGGezhVxf3n4kU2bi0oyFkZ9Ge2XhdNlGGzwAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-57516bb40b9so881907e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 01:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777884469; x=1778489269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7dAimrYwm3G27zNKOrwjz8dgHuGQ7JjwxtM6TGtY+M=;
        b=pUh3kBC1K0EXNA12iCwHYUR9zWVRWAGlg17SOZRUaxrmnq5O0wa3L499SDSdGh/kKD
         QDr7oG8xZ9Vc1s0a6b5A+Cwa87bfMTC1XIsNaYvJQdKVxau8eapU2u3VGfsT25nslu5w
         0sIP+56M43JCSFwIWUUjDNOCJWeT6kWxVOfK3BvVmRY0erhGq/QKGY2QTjg9WhZBNZIW
         c9pNfsXxRl4MyvXj7RiPpaC5FhBFQokY1jDNzHi0HB3OcRasRwp4MF7hYPNqbl2HWAUB
         wUhhA1AS1YP0NHlISzh/0ldbpNvheQ8udspoyuWLnYkYRS0j72m2ukEReXbtARuVd9Vi
         fXxA==
X-Forwarded-Encrypted: i=1; AFNElJ+jiHmY0dFWWdO9eCLxzmiehjnpw6N8xFUUVU5QGQOBGIEOekQzVRUhx9jNS24DShaMJfqp27FUuko93wNKNzD3jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFOJecKmw8TCTAekqN419fGNHfgqHq4DH+eEuCrTTFqtVolZgL
	0PmoLCceET3AcKhBHlXQaDBPpaNRMQWg8n1Dja0BWvGepQgkAiq3YCIGfPb12mGH
X-Gm-Gg: AeBDieud55lDPxSdA/gfXrlcdQJGC56r4FlwKA05my1mE4MgPvFmKF/tQ+urcHQ258+
	FrnqlPG6q1/B591GaVKK8rEFkXR7ArIvRLmMNeelY0gXtki4/i9Cpye9Qmpw2OZIwTGKxGdEjLJ
	dfeioEbAV2OGFLSO2IarbWZisEXWRrev54CfGHPp3U7sMRYnX8IJQCArQhbyptFd6oKyszcdnwU
	Bn9i1FcpFEi9X7S5pEXILo/1gp3IKcyTczZXzCrkCgQdPOOxCDCgnvTcNGNQjKyyh1OgrLnhLMT
	attmGDHiNmFqJLO0pkHgngKfEfGkm2oPdZFztgSijbn599mI/rb4djFLlbkxx/oz3796WgiZgqx
	OGk275heokBwKE6sR16xnR2IBX7HlzzzJ9h1QLbGVmDgzamP20SZLAoPh1Sf6dwFh4pk5Wq04Hq
	5+z1uLILr0q+3skXBH/C6cnkEmGIj93LeLLp6bE74fh1aUpfTAbL8ZVMWbPmKW+TQEEd4MfP9p7
	hros0iSMjU0Ug==
X-Received: by 2002:a05:6102:1046:b0:62f:2ecd:3c9a with SMTP id ada2fe7eead31-62f2ecd4eb1mr1209775137.2.1777884468798;
        Mon, 04 May 2026 01:47:48 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce068694csm5219332241.0.2026.05.04.01.47.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:47:48 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso4019724e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 01:47:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8PAiF9Q+0P8haYihl0WUCQ395cS8mMzBlvDpW7qsDvABLq+m1yGqtoUAVS9A1N++pxo41UgRDckqYHaXayD48kEw==@vger.kernel.org
X-Received: by 2002:a05:6102:6053:b0:605:6615:d9dd with SMTP id
 ada2fe7eead31-62d84a737edmr3283917137.3.1777884468126; Mon, 04 May 2026
 01:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com>
In-Reply-To: <20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 10:47:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=SVDL=7vShMgBas4KyUy7_XWs_9khLZSdggJofsA+VA@mail.gmail.com>
X-Gm-Features: AVHnY4Ja_beTfs2zJQEP15HITljg2EdKPb6XLKJOnEpV1VMzgSNE4T0gDnfoB8Q
Message-ID: <CAMuHMdV=SVDL=7vShMgBas4KyUy7_XWs_9khLZSdggJofsA+VA@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Add various SolidRun RZ/G2 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 390334BA7E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,solid-run.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-31930-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,solid-run.com:url,solid-run.com:email]

Hi Josua,

On Sun, 3 May 2026 at 13:18, Josua Mayer <josua@solid-run.com> wrote:
> Add support for a variety of oliRun RZ/G2 based SoMs and the
> HummingBoard IIoT Evaluation board.
>
> Bindings are added for all currently known supported boards, namely:
> - HummingBoard IIoT
> - HummingBoard Pro
> - HummingBoard Ripple
>
> Device-tree are only added for the first board to reduce effort.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your series!

FTR, I found documentation (incl. schematics) at:
  - RZ/G2L SYSTEM ON MODULE
    https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
  - RZ/V2L SYSTEM ON MODULE
    https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/#documentation
  - RZ/G2LC SYSTEM ON MODULE
    https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
  - RZ/G2UL SYSTEM ON MODULE
    https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
  - HUMMINGBOARD RZ/G2L IIOT
    https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
  - HUMMINGBOARD RZ/G2L PRO
    https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
  - HUMMINGBOARD RZ/G2LC BASE
    https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

I believe "BASE" is the Ripple?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

