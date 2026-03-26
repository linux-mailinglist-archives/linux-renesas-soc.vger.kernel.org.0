Return-Path: <linux-renesas-soc+bounces-30355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAoeDw47xWn/8AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:56:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 051C933661E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE1003062205
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 13:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1708030ACF1;
	Thu, 26 Mar 2026 13:55:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01D5231A23
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533305; cv=none; b=FTrKYb+8WeycVMcc2OYGRvYAUzcnbQIdbYfBlSiD87JDv/e7CMfGSQdp1uIxMBeFE53hmAI0i2mNZ57Zy592M5l7zK7gVB0spcLC7opafOJcfK+f79uDNZy0IMb2QWrXsIJlWFk+uO3Q/W9CRp1F9l0Abw5OZKkrxbZ7eXNcBE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533305; c=relaxed/simple;
	bh=PrdVd4X1hWNcsssygPYsudpiYX/MAc0rIL671UYG3fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HmyMARIl88+2gDGqQdhcAGZrPL3pH2PSG6eGB2r/ygDUb+l50eXyMA4rdj7Xdt+BBbtCkaSRz2gzDfTIuEF6KUax78WRaTeNhwOFdsfq58qUaBAsPU2lABnz73xwPXGGHOxDz8WwFz5H6GQYq0eTUSUWCnuQGUimGSuVPQnKREw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56d357797acso601043e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533303; x=1775138103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Kjle8Op6pOPl0dSvzRbB+JPH3/6RrwN6QyyD8dpN9I=;
        b=oHLyrbqaG+0iA56FGeXSggQw1WqsYPRpjpWpR05inT6Jkfnj6cGlQrhE2VAEf6J7vC
         fY6sKQVaYsS1vZDOLQN05Ty4vxF/0STOqXAO7RT0ve1NJSfByZGuwNaC2dGIl5Ey/wOh
         2l3VNLbEDAWLG6GiWP5fxOl99xZ7ybCF189Ql1yhkODg/Q087xpV6RLMEXEiSWLlF6f1
         AdRxZeUqEL/oxhW7lfuQZBgEA3ga5oal94E0JJJ4bDNhg1x8F28uN1Um1j/mzGRZLCmu
         XDf88xQjbjNWOqsAvVO5SC6T5tuxE6R4t+SuL6l1noFXOMkmNoD3zF5DhV8S5ZmPRzug
         sVtw==
X-Forwarded-Encrypted: i=1; AJvYcCXOFrGxfbfzgBKXR03vzzyHpqUvsVyPjGh9W4TKRqDniqepztSWMjNucjJNHrLUxED14F/MUZM5OhvzJo/IXEdtRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ7kdZ5gtfWNgD+OKJu7Gq6HBUqAo25S9gUasogRplr3hTRqx9
	YXGXgmu/3mQcFTB6X2ReqcQC4hWFvvXTDQxkvSvKMnqNIhNrRhC48yK855jkx4V9dRY=
X-Gm-Gg: ATEYQzwmovwmBBnvruj51uoXwkP3TGjVheuhNPBImFagV3r6NJWo20rHzZY6B6DUi/U
	onfKcopx7LbRx7H5YGb0zOCbcV0r/MwOIpkRLr25uF2QhvpngvTtOqXSf/w4/YK1dd6aD//U5j5
	7mPCyjcHhocXJKlzlAqx2J6B3CcBC1jiKgKp49IiYD3itTN5FoATL72E9PYT/xxpy5VRSnNw/Wh
	wxirrP5YH3ZGTwWGUz5yNWjnXwEM/vrMcbQwJkfLi1sp7TQHlKJh1kvqvaiw1oE0t7mfBGjSM0a
	ZhQzwlJcW4BhKVKBGygko+DbOMDPfW/Hz02pRKlj8Mdz8LkiGEvU7eH/1baWWzVowLSjtzBeGuq
	LVd67A9uOCgSrsAwx0kWHNyE3vTxRPrPdVrMJtJvdfp1trrVpen23MjuBSqZt84ucU6vS8Msu9r
	RoypKMkbN4baXjVoMaqWOpNcgNjllSswqkIllM+3NFn794+QReN+GBnDeFXQC7vsFX
X-Received: by 2002:a05:6122:c81:b0:566:4689:46eb with SMTP id 71dfb90a1353d-56d21cf97f3mr3810217e0c.0.1774533302553;
        Thu, 26 Mar 2026 06:55:02 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31c29de8sm4268252e0c.6.2026.03.26.06.55.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:55:01 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56ce07a54e8so718711e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 06:55:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVV2keF+DQ4QBOzJGE2QblnEPo/+Xl0Y3KtEoao5t9xj9DzrGL11z6p6fN/PD7bak4iqhEtipN7C14O+eBd+W2BjA==@vger.kernel.org
X-Received: by 2002:a05:6122:e1ae:b0:56b:5893:d042 with SMTP id
 71dfb90a1353d-56d2207aecamr4251415e0c.12.1774533300590; Thu, 26 Mar 2026
 06:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-11-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:54:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWaR183q2zV2JdyXz=-PAPYVUg4FthVb7zX0E--Nu9wtQ@mail.gmail.com>
X-Gm-Features: AQROBzDOjjqprm8ONkegDcLY6zHuW-QzJPJ6tL6gtrR-q_Ul_XX3Xr42DBeHu1s
Message-ID: <CAMuHMdWaR183q2zV2JdyXz=-PAPYVUg4FthVb7zX0E--Nu9wtQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/11] arm64: dts: renesas: renesas-smarc2: Move usb3
 nodes to board DTS
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30355-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,glider.be:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 051C933661E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The SMARC2 board DTSI is common to multiple SoCs. Move the USB3 nodes to
> the board DTS, as some SoCs (e.g. RZ/G3{S,L}) do not support USB3.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks, will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

