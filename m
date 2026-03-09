Return-Path: <linux-renesas-soc+bounces-29054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJkFJeeVrmnRGQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 10:41:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D4F2365E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 10:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2697C304925B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 09:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFB937AA93;
	Mon,  9 Mar 2026 09:36:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5A634F48B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 09:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049001; cv=none; b=ZEDF1OTfq46zfjgKVrFRDvEZvKoL/IIzFZB2om4wpfcb9urcpDGo4zm3d2kXfhlnFvwr+zoGBPr1nyWZMaQAuVt/2ZPs3r5Emac+LVcZ5Zfqlb2bZKkViRPzeGxoduPUDO2LBwK2+rraf7vsbjvXsj8I1OM9Ph1njXpQrNj62UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049001; c=relaxed/simple;
	bh=V0zExlnXuIHJDhxez6uHhdL5eoe3H9qmKW4ZfCZrtvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDSPGXRFnyKnhYx30PZ93bR2zMzCO/u+hcKh6rEPqXekd7/BUluuGWQcvYTn9CbE/2QzEFjOK6H/53hZWQ4hJsrrGbf/8Iq76EBtXNdmqpth2sX1pTpo6BLSVc/boATy/PL5A8jqMJ5b5uK87NV2r1lVRUurLKTjAkC/eoBQiS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56aff27dfebso2946298e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Mar 2026 02:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773048999; x=1773653799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jIKmoYd78aaA1sRvEBfZ2a+5uhvKFRsALWY2/5L2W8=;
        b=Jc2zh4HakWs1A7PnS1zPCbNkCJ0kMzac4AuIbAA4o21KQnWP0ZrXqiFMuUrXXgUHsa
         0UC29hZz+6Kc3IEmeBjqa5t0ncEHncH9Mix+nNMx9wMN8p88ikbqWYPEg89Cp57ljgJB
         sLTCzRLrSwDiqpXn0mQ+XqXTLMwIS3eswO0MTDWaxApFfkBMJtlSuiy3m04kWUYToQdQ
         OFquEN/fryNe4iWYfpTQrbkGW1aaTzq5GnJgKUKBV5TjGCqXHkr62XT+iXVzPf+nTpc9
         rp54O7KRihC1i7dy0krLoJfpa3ZjPL0dVVpmP3Q5l6zKgFDkl0qrW7j1Dt4f0I/PXQR0
         fPpg==
X-Gm-Message-State: AOJu0YwfP09wfKRhLq6E0a9AQ2oGrUXviEhiXl+Vfuu2gIrRWTEaadVf
	tceyY4m/y20+wuhLrqGMRUrRMI4seDtp1Z1c+Oz5zpqJdTjR7/xX0GFdZaTdFwB7
X-Gm-Gg: ATEYQzzHfz26AW2HogodlTXtcM7ME06/7ZJCRscNGQOhq8Tsle0F69chDzvg50EroI1
	62b1TJjpfpEwpRGbagRKODv5d/6d8ogkcBVT2zrKEBIn+eIRJXHp8mqwjF4q0i2cRLhDA835UkN
	jv1sPmJcksnHN/ZbhcYYkxQexrFboTE8ZRAaMzcfQCQzpGSVnjSv20i8NS2Q5V/BuWm2oPHdWoU
	0l0bd9cWI5Hvmt/k3iT+VquBZ6qmH1IOD4G0GyPBr/oWBOZD44uYg1y7CnaFESt20OPKNsQp3no
	BgeHHLRpSKg2lbpltnMSLYFwg/2ZIQR6NCXoJJdv6suFzzRIpv4hxJL6y5Bc4XRdN21p0uPL3L9
	/+RQl4+vNArKNomFG4j8ppL3AustgSfLn3xeQYgu/8qZOLY6cVuLsoRvo0MdbvUDpRsiPd9PscF
	Ex7PNGLWPcRJc4FiOa62ZYFojJzfPU+6U6/+he3VU4UFX5Ol/ywD6nCbnK9rP0
X-Received: by 2002:a05:6122:789:b0:567:44ba:bd8a with SMTP id 71dfb90a1353d-56b07e516b4mr4481116e0c.9.1773048998743;
        Mon, 09 Mar 2026 02:36:38 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94e7b30a7dfsm8107266241.1.2026.03.09.02.36.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 02:36:38 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ffe68892efso1895443137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Mar 2026 02:36:38 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:5ff:24b4:8992 with SMTP id
 ada2fe7eead31-5ffe5ed7f01mr4381807137.4.1773048997957; Mon, 09 Mar 2026
 02:36:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309073856.2209-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260309073856.2209-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Mar 2026 10:36:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdULdCipbrBmvuX39MDE_y4nbKKEQ2uz12kd2R+pRtRo1Q@mail.gmail.com>
X-Gm-Features: AaiRm50-bLsQPsUg5LwFhiEFCPgLUnASmW0Rcy3j4UfX7IM9R-WpTLiGpoHgWiM
Message-ID: <CAMuHMdULdCipbrBmvuX39MDE_y4nbKKEQ2uz12kd2R+pRtRo1Q@mail.gmail.com>
Subject: Re: [PATCH v4] mailbox: test: really ignore optional memory resources
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E1D4F2365E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-29054-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.328];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sang-engineering.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:email,linux-m68k.org:email]
X-Rspamd-Action: no action

On Mon, 9 Mar 2026 at 08:41, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Memory resources are optional but if the resource is empty
> devm_platform_get_and_ioremap_resource() prints an error nonetheless.
> Refactor the code to check the resources locally first and process them
> only if they are present. The -EBUSY error message of ioremap_resource()
> is still kept because it is correct. The comment which explains that a
> plain ioremap() is tried as a workaround is turned into a info message.
> So, a user will be informed about it, too.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v3:
> * fixed __iomem annotations (Thanks, sparse + buildbots)
> * rebased to 7.0-rc2

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

