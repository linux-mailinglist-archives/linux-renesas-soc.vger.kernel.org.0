Return-Path: <linux-renesas-soc+bounces-30692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sElRLbQ4zWnDawYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30692-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:24:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFB537D00F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A5D9B3119DE4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 14:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248F0317144;
	Wed,  1 Apr 2026 14:55:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2623264E3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Apr 2026 14:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775055352; cv=none; b=k4okhniRbPsLCTpFbc73RU48Tns+RbcxMPm1TzTJG1gMDjrgqLQUw9r/lAg0fWfseoqoHcPtbOf+knHnVEspP9+2/gk1FHHB7TEl6vjsTGhKlrpClAPIJ7QaTIfHXpGHFNAiIrtGuziMXvpRgZ4PJf3nPKsSlMdC1rFA2P7VYHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775055352; c=relaxed/simple;
	bh=9VTPY8g7oIv6TMfkb5vxRYMgbi7A/wHcnUv89A8x4/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=saHrAdSaorQgpQnmaYYiNTTqCMhyJSe7KZwgSnnhRSIQXBllzDe2zwgCCQdYQUTe11yveEgzBiy+8q4PxAjOdpl5kjrZzpc2NvQvfMVWqKIUr2uu7xtqFIe3FB0JPFUfsSsq24yRpOZPZg0riMB6j4EWyFOYLgUXwBbFs3ZPjRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9382e59c0eso1125732666b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Apr 2026 07:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775055348; x=1775660148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3OTPNogNajS6XpWemWBVYQAqCuRMbqVz0CHtg+iC7Y=;
        b=sycKUfFyMvh4T3s+heDNbAhniAr41zdYCI9BTLarijRbJUVYsosHgRy6QTj8F7d9gq
         ca21IFFoGP/9uROQIl2thhV2zFW5b+0TQ+yhoR16QpBl/JSHlqT9HUKsOdVkLmJkIFUC
         diqIdIUW4RdgbHeo60BckJbGTQX2h8lSEkt07j/q1qHDbp1Hfpo9xpsQkeSTx44zNTrz
         qQ/Mo3iGxQhFHTwxAcb1d3McQh87ZIwvjYTizGUT+lPf1CZYDISozTWvVQISyR5E+rTH
         FpiO2v1zT258l4gwP9bbAoqsx4m3LJRGc1lHJWjVWnvpkqD6/a6fIy04VMao/XtiZ71B
         rZEA==
X-Forwarded-Encrypted: i=1; AJvYcCV2KUZvBrEoTDB6KvgxFH9yPco8OPVHo07uiy69kIahZarl7QaA/ZWkpz/DndJ1zz9M1rFHIpuWhNWqNE1ClHcTEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCDKhPc6rMEAdPZYEXwO7qr6R/lRdUicnlv8f7X+htUsZj21Qo
	lkc67mWiRMRlNtH8GYlip7TX8Q+pWHSHnmuO+3UsuTVtxtglUIG0p9xrnyL1BduyPhI=
X-Gm-Gg: ATEYQzxGuQb4ACYozO54t4N1uL4V8ynAUvnQNYY2X+e7gieT6sy+Go7IbsA6FE2a+10
	9BwRaWz67XF4eWjhPX5LAhVnQ7kXUaD7O87iCHGGZgTffExDMNRjwnxmgC/iigxdoLJNqcnCK9P
	PXTWHm6wUyvAi1lyTMTVpzyYsjDKL7manzPKEj7Djq7exl5bsgHLN4DvbwXYvR5vEtLqPmiggYB
	BiCsbYgZREJMgn1VmdrZcA/PtJc3uq7P2pjvvFW4pQjq6oRNEqWLPD0X9lAfNW+4xaDv7+Osne/
	aD0Z04RCD7jnS2lHgdosz8/gVQDGn47t7uzDjDxoZAUe5VGqjEh5keEP8Wh2a30/HE3iH2BHPQV
	lLbdNA5m7ltQ2wDG3zKxWRDe3JQeRsLyS1nPLhcb6W0cVMoKoOpDVd5y3CtjunrZ9YR21hEouDZ
	61VHS1FKjMSmhvjmUAwQpTOog2dWsnYQ1XpRfda29kuLp6fdpMwyAbn3/vqI6J
X-Received: by 2002:a17:907:a0d4:b0:b9a:3ecb:51f8 with SMTP id a640c23a62f3a-b9c13790ec6mr287758566b.4.1775055348097;
        Wed, 01 Apr 2026 07:55:48 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5924sm534022266b.32.2026.04.01.07.55.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 07:55:47 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so13205620a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Apr 2026 07:55:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNp+Br5masO766NvkPX+yV4mXbNDp+DNaeFG3SPRs/kCuM8DJye1y87C00/FbQKUx++NPGnMYle/+9D2vosJw9Hg==@vger.kernel.org
X-Received: by 2002:a05:6402:538b:b0:66d:f247:cbd8 with SMTP id
 4fb4d7f45d1cf-66df247ceadmr294684a12.0.1775055347067; Wed, 01 Apr 2026
 07:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401143347.8463-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260401143347.8463-1-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Apr 2026 16:55:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUz0wRuTw6PCWFskBQ+vn8SOzGpDRAa4YgYA2OcNbmxLQ@mail.gmail.com>
X-Gm-Features: AQROBzAbH87r2KzLGilvxvkcI_ITyAO6gxSiFE7rkB1e8Xx7I6YNsjz09w59TPw
Message-ID: <CAMuHMdUz0wRuTw6PCWFskBQ+vn8SOzGpDRAa4YgYA2OcNbmxLQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: rzg3s-host: Treat link-down as -ENODEV instead of error
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
	john.madieu@gmail.org, bhelgaas@google.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30692-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: EDFB537D00F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 1 Apr 2026 at 16:44, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> rzg3s_pcie_host_init() failing to establish a PCIe link does not
> necessarily indicate a hardware or driver error; it may simply mean no
> card is inserted. Demote the message from dev_err_probe() to dev_info()
> and return -ENODEV so the driver defers gracefully rather than printing
> a spurious error.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

