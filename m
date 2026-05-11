Return-Path: <linux-renesas-soc+bounces-32343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OoOIk2IAWpscgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 09:42:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 400775096D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 09:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D6CC30AC733
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 07:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63518329C54;
	Mon, 11 May 2026 07:31:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E01A346AC1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 07:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778484665; cv=none; b=F99YhRssUM8Hd4EzeMwLYw7kCuaperroQEAJxfGPPCU2P7eRcFjHtZl4t5kTzF36mRurzqsdGuPMT4cfAz1vMuOVxQ/pYGtwILYfKKv2TrwsU2D8IVwqUCTZ5ykxZslLMaQq4yrnzXuK8QO61n2PUAp+9Avt8Q4zLots01BSTTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778484665; c=relaxed/simple;
	bh=s65DhKGzlqdgx1hXmqJEwOu0B9ggiJ8RQ9fMSjlzAzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKFtkQJewweAhjnl8BulGxUOnALGLkSe3w2xvd1JMoucA7xEvoIZ6dJWt9iAlP34o+8pg718i95YA5edEog9R8GU7GlmAhiyO2bqcn+HzjJIU/6snUWLgVmpqGm0urJs28BaqEAoyW/7ct5CYivkqtV9OvHUf7gd0g+n3r6eAPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-632e479586aso774250137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 00:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778484663; x=1779089463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJ1YAZJS3C1bc4JV8cVyy/jeADBGGrNxPHy4hNy4Vlo=;
        b=LRg8A69erL5aVB3Xd25g0B+PwXT2CIudlWuiB94xKQ/Y4qGT4+pn2/Vq0lzAc86hfO
         Qzo5XHl12m1LFN9mnyR5MGPil0GbrF6uIJFFur8O3Exrk48Mmme92rblK9KWTm3+T+iG
         H7Y4zq5lP0mOuj5MC3z8u9Uj6+AQJxT1nIOKY6m5AvEs63rbBh8DlGjWd4a44K6vnqux
         EaiATCJ6yALkUobi92W8tRO2eanNy0AXbVfz3aMFGnMcIsKZsj0MhDGjluxUei6BX+eG
         9L0/+kO96ad5oDqsK7t/BECOoIuokXNFOpW8mCL99ohMvixH8r8HIqsVxnwM4kxkKkiX
         83/w==
X-Forwarded-Encrypted: i=1; AFNElJ93Ubjt8hwcboVNfssbpViKH+7Sqft8qKjLnNkKZzua4WBBhvOZXhAK3IP0N8HcAgk2Mvhlxo6JSvPNS9VjGM4jQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdzEHMIizTXGjJsCgKMkWt8ykw0AzOJtgDknxfpS/ZR4/D9Q1S
	s3AvKsDC3BEvf+p6Tr5zFAVmqF/FwEnUN1FwEj8wSE2E7ywcifRIhq/9pT9NjBtI
X-Gm-Gg: Acq92OGvNqePiyWx3lKMvEUd1SVT039kHwyCJ/Dc1kjH2jDdxBCJTzWPH7E8hqXpqJ1
	B+BnZOPBypSYhcIv1y7D//J6p5LPQZ3T57s6qzoyWe9TQCjSQX3kKE8Y1BUNv+aD2gNtuFWj/Vg
	7hwIlOa5itVjqMoGRSUFAX2XHX9jIsxhq09qi1TxU6OtAMqqDosl6GSCvhWko5OJlrB+FdmOUXm
	drBzoYceWuyCdmvp2Ewm1mHmU9s4X+TjIKKFbwTJbjLRD9MlQ3+mvc0hBpQYwGxLDF8aB8YBwDo
	DlNBtrLQAqiU4Q4edU534XjVrN3TO8RevtBR0IKgYzRCOiZyJtZk/bCWcuCnintdS2NqT0lj9Q5
	F9Anwf8dfwnFzwqvWuqG7sH84JgtpeIjFxqW3qFyT+ySzQvn9D3QD0q9yIKgs5iHDuqZgv2u755
	i6B9/EAqRtNtvD2JIe59BhwlHFcoVuDqFisJdvQMEYJ6lDKAHwZ41fE0X1XMcJ
X-Received: by 2002:a05:6102:c4d:b0:631:2624:e5e7 with SMTP id ada2fe7eead31-631db4608eemr3211171137.14.1778484662958;
        Mon, 11 May 2026 00:31:02 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6313ffe8ab3sm5442512137.2.2026.05.11.00.31.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 00:31:01 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-632e479586aso774223137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 00:31:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/OYy0F+dff/1lGCIea95FBUOXBB+9fiReR6+GWiXw12eumZcTSlO+zy2mJ4HuCuf4JIwQSHlXDLICqWpCeXWkGcw==@vger.kernel.org
X-Received: by 2002:a05:6102:441e:b0:631:3bbb:f23f with SMTP id
 ada2fe7eead31-631dc2a4197mr2908988137.26.1778484660482; Mon, 11 May 2026
 00:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-1-phucduc.bui@gmail.com> <20260510084303.122426-2-phucduc.bui@gmail.com>
In-Reply-To: <20260510084303.122426-2-phucduc.bui@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2026 09:30:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrPChcwzbwrNLZBoRXGQ-Gm4e7UwbOm9gfAzQ-TQzFqw@mail.gmail.com>
X-Gm-Features: AVHnY4Jl1iI9-jny3Tp3PAtW_VwhT3ITP4kLVRV3eN_UqRHFiAafjgaCkehlGn4
Message-ID: <CAMuHMdVrPChcwzbwrNLZBoRXGQ-Gm4e7UwbOm9gfAzQ-TQzFqw@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: phucduc.bui@gmail.com
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, krzk+dt@kernel.org, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, magnus.damm@gmail.com, perex@perex.cz, 
	robh@kernel.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 400775096D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,vger.kernel.org,gmail.com,perex.cz,suse.com];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32343-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.894];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Phuc,

Thanks for the update!

On Sun, 10 May 2026 at 10:43, <phucduc.bui@gmail.com> wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
> accessing its registers. Without this clock, any register access leads to
> a system hang as the FSI block sits behind the SPU bus.
> Update the binding to support multiple clocks to properly describe the
> hardware clock tree, including:
>   - SPU bus/bridge clock (spu) for register access.
>   - CPG DIV6 clocks (icka/b) as functional clock parents.
>   - FSI internal dividers (diva/b) for audio clock generation.
>   - External clock inputs (xcka/b) provided by the board.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Please drop this tag: it is intended for giving credit to the person
who suggested the creation of this (full) patch, and not for crediting
review comments on a previous version.

> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

