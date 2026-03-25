Return-Path: <linux-renesas-soc+bounces-30259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KqNNtgNxGk+vgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:31:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF963290B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 17:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2A413203624
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 16:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A86218845;
	Wed, 25 Mar 2026 16:01:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9057E35AC01
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 16:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454489; cv=none; b=eThE3Vb4b82dlpk5mVkwdVULxpi7qj/Wx46Le+HJ0YN8xeiumCaYOk8Zvpxt74PP3d0sdWXu/rLHsAm0bz5q2mHxQ2llzcDU6WzsKiJjMTJa0HBAiJ3v613ioR8M/R9iXfxYhxn5GRVvHR508I5vYi8o7+68KyybT6JE7xu5ndg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454489; c=relaxed/simple;
	bh=AIVPf3es6gRbVZD1OjJY+7NHbNGFfUFHbP5UCcb+Ibo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghplf7kGPwrS+cqquz1IG8CQLv/hYi2Ulv73l4LzFc+UNPuxP6TnW4LfGm5+jgH2BVyuiG0GjahNkdj2x/THz0JvrHaG/S5x/4wg9o080pnuBexfoD8H9zf8GmFUxcIFUUjHz8lQ+r3h8Oi2/DTnBjxy/VP/nL47EpCDAGn92Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-604d52b65f2so16657137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 09:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454487; x=1775059287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsaKl4jnMb/iLg/tAunTjLfMtEyxekduMqGv5XbCBMw=;
        b=ER7iPXHALwQQIQF0j2d1kOs0CkW3nZckOEBG9I3kfL+pKyz73x0yyUMv6ZVr6kVYP/
         rw7dQlGDSf4lPfzaWEd0+5ArnfNMBKJh10ODIX/HphhWznsT1phLC3s9UdvabnFX6+vT
         dMnOv+qWAtm81hT0qp7SLEpGq4AfwEKJpGqWweX51eLdnZecMKNqFhLikkuau/OHwDnG
         7vuGpPUBZn68gwVh57WQpYd1WhMx91OaSjBQM5TJTHNnR+1F+rIN5+SK9u1QWDNJgEAE
         K32sy1G5aLAMLFcNEyRnel+hYly+9IAESdMRThUVxrLNDQu/ry0t1ve6PJwX1LBZLN70
         F/Yw==
X-Forwarded-Encrypted: i=1; AJvYcCX8bh/E6ZPGQqp6oj4Yl5ysmuW2S4a8Ov2Z9I7g8+VTnAiQ+Io3hVhLu138uhGJ5rWloRc0FNcRByJXA7o1+9TL9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj/1goR/fFwoU1XXRNqGjpekKv7G+vxfiy1SYwTmqHM3abuMEe
	mQQ5J1EyY0hKLyFuJ99C35qdmYS1PPEmwOjfY9CkhkfNNTz8epxunRsjnBbMzOLR37g=
X-Gm-Gg: ATEYQzyskPAagP0MiX2npGZovMj9/w+hJxPkTI6cnqkL+9PFZKh14FG4zjm7xGqU0X5
	owfJS3U1h9C5NvRnR/M40NwUB3i/ZHOWlEsNgYmMcYVJCrws+gJxuF5IvcXEPV1oB96ZZQuWQQm
	sJHdRaM/ClYLDi/THJwxAgYC/7FhlbZcFcW1V9jOy9rbBPZybSu7yNSJNewVpZOSkR6gtO6VUjX
	WDDqbDsVSjhhfZogC2rC8HOHcVb/UXXEyi3Iwjhevx63g1zBTlnNIbzvDrOUoYvENZ2a8MFO5kH
	aOoMIl7Kjsn7plEFdKUHkJpXJ2Pc97aPH/+dwdw4xWnxSKYW7gtiTVlwI0CGewmMYPqd9xdQ731
	xTQNl5BRcpoGx6vaB/62PHRQGh2aysqnV9cNxWQlm0byAOONAmIuiu7fHA7B300+9eHO5ytLkQ9
	GUhvkjIX4VAPdvIkGq5DomRN2sl8B++oEKjXE6h3qSxUAyneQFtovr+43hFJsq4Z9K
X-Received: by 2002:a05:6102:3f05:b0:5fd:eacf:27df with SMTP id ada2fe7eead31-6038723a418mr1626323137.10.1774454486819;
        Wed, 25 Mar 2026 09:01:26 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50649ccsm97359137.3.2026.03.25.09.01.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:01:23 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56cc8a021e2so790700e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 09:01:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWbNXgT4XxlbSw9zYoiu7WnglgnWaGI5FXUFuPvfAuYlQ6z6ppTge7qdOBpOAFQlazw7Bec1dQ1BmEq/F4rxewSw==@vger.kernel.org
X-Received: by 2002:a05:6122:488b:b0:567:4f98:fb82 with SMTP id
 71dfb90a1353d-56d221484dfmr1919276e0c.7.1774454483312; Wed, 25 Mar 2026
 09:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318085119.44717-1-john.madieu.xa@bp.renesas.com> <20260318085119.44717-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260318085119.44717-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 17:01:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKCxfWPTyoV6nMGHkK32eeZFSEXnL3L2C5kGtOTUtJqA@mail.gmail.com>
X-Gm-Features: AQROBzDNP67-ZuO5q3SWFmFGIjuJmCxHdim9QMA2vOC8b_1VjWoGuY0s8rTuFQA
Message-ID: <CAMuHMdUKCxfWPTyoV6nMGHkK32eeZFSEXnL3L2C5kGtOTUtJqA@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] arm64: dts: renesas: r9a09g047e57-smarc-som: Add
 PCIe reference clock
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30259-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,mail.gmail.com:mid,glider.be:email,2.220.108.0:email]
X-Rspamd-Queue-Id: 5BF963290B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi John,

On Wed, 18 Mar 2026 at 09:51, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> The RZ/G3E SMARC SoM has a fixed 100 MHz reference clock generator
> for PCIe. Model it as a fixed-clock and assign it to the PCIe port.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -43,6 +43,12 @@ memory@48000000 {
>                 reg = <0x0 0x48000000 0x0 0xf8000000>;
>         };
>
> +       pcie_refclk: clock-pcie-ref {

I will change the node name to "pcie-ref-clock" while applying,
for consistency.

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <100000000>;
> +       };
> +
>         reg_1p8v: regulator-1p8v {
>                 compatible = "regulator-fixed";
>                 regulator-name = "fixed-1.8V";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

