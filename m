Return-Path: <linux-renesas-soc+bounces-27440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CEyBwmPd2m9hgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:58:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A65608A697
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C2AE3042D7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 15:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2C2341653;
	Mon, 26 Jan 2026 15:56:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393B5340DA5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 15:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769442986; cv=none; b=R/40P3ZkJH/ye676SDChzUbMLmRTzFs03PzwbZ8ZqZsFLQTpElCMYwmPb5K/rHbvq6DojqlI7NzXflLvDQtL/GGHY7mTMoy6BQRAEFQC3C3F+iqbNlvAmmwX5TvQVLKlYCY1VRoRrv0eE01mdOVzu1mCN2ZLFAVmJ2UCOiYHBVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769442986; c=relaxed/simple;
	bh=j2Ql7ryMTYd6hLKkTTmh/xjJDWhevGva+bLot43hmIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/3PdxlOfb2+k8mK4DYAlouJizKjbFMyXCGTVZQTH7c78S0Si9e980M1/7hIBlrMQ1ECqAo72Xf1h+BQylYJTCuXTtP2bDMk/TdybQ7ZiZwfpkkl5MrtISnIu+EtLmt2ScUQa+BOtygXX2LFwIgIeZZS7t+97SPfkuFqzx7qsS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9483ffbde85so837289241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 07:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769442984; x=1770047784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bW75QeMDV4a8PkPxWmQfsAC+HhpeyRhnFa7BZti7x6E=;
        b=LuHqbDT4vkbe39mrEUK8J2svWoWHm8ICvYSlscCL3OH1JQT8zqQuRM7mBeuZFICleZ
         mIZYFgt6Kec72WfzX+M1rXJKZ4FqaxlGxRq/SHKj0oS6f2l483JPl+t8yQ8HjW9rgdgK
         2t+d4ulhPKckAIdEhZgjkeIPT+7ZoE71k1cPR5jx3ebzPjgEEWGhOyubfUr0fAl3EyZ4
         YroxmL2op+qlWX3BRdmHjqe0tbZr6H7CWIFPivDZ4Nn0v1h43i404gd4gTieOzKXvVLa
         UZbMmn68+8p6Hgt8ezH14f6K3kH+WYR1ANy5aCzh1D0ypHwnSy7E9TuGVhuFa1v46zMe
         gAxg==
X-Forwarded-Encrypted: i=1; AJvYcCUQxQiCg1Wf+ztO1ogNTOhvwGLIT6JPJLYS/ZOheqYxJIMBAKuvUcTcarsKzvvUIQDblm9+wYdBoIgWsP0WgMvxEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7bSSkQL+cEwSg1t02tQFFm2Ral26rIEBf61H0G+8wBi5DKh0K
	i+z1ZRelA8FshCAWH23srzjy0PwJlLcYLP8bp3W2FXqDi+GbelIx5k+J1BNjDKkn
X-Gm-Gg: AZuq6aJnmbmIEAlTRxz7OWDN/uhBEptZ4bszzIW0A1OgB5rEzN/BY2YxfYbBQpH6cOG
	BWS8I2zhdM9H5CLmF7yMTddBQMYfkZUW5m8qDkFRKMx7ffB0JS6NPtlPNkTbFOc/AuPTcGBLI+F
	uNrrznhcIyBnHFnMiEBokxVfA5FvNfFnpQCep0OqH8oKjuL1g5cHCw10m4gr/3THvCAhlryxXDx
	x7ifiPceUZnn4C3/p5qOI4qd5SHju8nF4UiivNbDnJ4NFhp5cUOOJk0smpXjRR0cqS2pvRMH3yM
	lMvaS3UzaFbFGApXH9FB6iDp+JTaLM/OjIrU8YaUNrGAcKazo7plDy6gMGNSgDmLr5AJp2Et+uX
	5qomhS+NhgUQdxuxmunFEH7aSZimHc9q+oO9oRnBDIkr1gRrW89+w296rcuKmU+0QdxqbMqxAjC
	y3aGQlhdgXyUHifddeKXacIYtOWCp/Rk0EaA5xTLeemWWJi0N9
X-Received: by 2002:a05:6102:e09:b0:5ef:a3c1:86e1 with SMTP id ada2fe7eead31-5f5773d937dmr1506836137.11.1769442984155;
        Mon, 26 Jan 2026 07:56:24 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d66c977sm2131715137.12.2026.01.26.07.56.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:56:22 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5f524301a76so3527054137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 07:56:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVWbmqtxYOVf0DNoYfrD8gjkaWelNYv/o+k10W3edEAoh0iayraUkcHfDnSFUIK6ZELR+P7uJg/xkWw1e44GpZpng==@vger.kernel.org
X-Received: by 2002:a05:6102:5489:b0:5f1:b58d:bede with SMTP id
 ada2fe7eead31-5f57727844cmr1470425137.7.1769442982080; Mon, 26 Jan 2026
 07:56:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com> <20260125192706.27099-4-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260125192706.27099-4-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 16:56:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeGJO-byndbrDDEO6dLun8cyfqe9LZf6PYRP+HG4OONw@mail.gmail.com>
X-Gm-Features: AZwV_QgJ0TDPdAIJdv1mbLt6nJx-pGX34vWTaFM3iyDnGfxutud9aETDmEzc77I
Message-ID: <CAMuHMdUeGJO-byndbrDDEO6dLun8cyfqe9LZf6PYRP+HG4OONw@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2N support
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,bootlin.com,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27440-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: A65608A697
X-Rspamd-Action: no action

On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The Renesas RZ/V2N (r9a09g056) RTC is identical to the RZ/V2H
> (r9a09g057) variant. Add the compatible string for RZ/V2N and
> extend the existing RZ/V2H reset configuration to cover both
> variants.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

