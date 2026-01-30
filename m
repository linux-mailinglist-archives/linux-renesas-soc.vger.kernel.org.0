Return-Path: <linux-renesas-soc+bounces-27661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHQHBxWUfGlPNwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 12:20:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 918EBBA009
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 12:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A90D33016285
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 11:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E3A271A71;
	Fri, 30 Jan 2026 11:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdqmmDEy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C835421ABB9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 11:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769771858; cv=pass; b=FRmlXJiNe0hQ70rmrBoesnzxvzrDxyhkWazXXWGVnC4vt/WW8IBOtiAV15oa8gRh+mLCXBNA5M2Zji6TpHy5o5vOPtYY4jJnxeAR6AIyNu5h9Hk0SuG1NVp7p3K2Kg12Q/IbPfNiHPitBPUdia3CtMDUsKfry+6mE9LbIsnxr2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769771858; c=relaxed/simple;
	bh=ieMzSSdmrsaSxdwMH87qOa9PeH77tWwoNBVCM3sLEoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PaJE7XDgmlrK4q2c5Jj/kDrcMpFca9E2slxqYsxT1scMQ/MTkpL6d7hum9XjBM/yCmK5XCumNITAwxNV19FZWePNBl98CVCs2Ue/rXZsL0G6BRSHzpOq287BruiT5ETWQ1LN0ZplQmdjXe2N8VCSFNEFpksg8Uu79uP0sLBVQzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdqmmDEy; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4359108fd24so1202711f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 03:17:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769771855; cv=none;
        d=google.com; s=arc-20240605;
        b=edqN915BX3r7kP6YBD0QKZG+doEc6JSgdE4ARKGR+8wIyNyDZYhnerBc+lCCYv22UY
         yxc3nFSzhgWWdgWr51ig0+WUYrxRZHqJ0wBcOcBFrwc1DZPwSlIWM/r7bDSmtslynY6c
         R2CTL2oU1pVU7+5M0KIUiBOMPje7Y7HLgXIQqYvS+J8q/O1KY1alEs9YnAPHgIxslWDP
         q3e6Ly0sYDD5qPc/r433V20lzW4vzhMhf9Edh9mtbuaGVzk3b85ZtliMEP1BCyQNb4TV
         TPRzGT+Ip0PGtRPFHBeJj3fe1X03MfKYLAief5aIFdmLRJ2TAH0p5rYRa/Xq6ez9dLUn
         TXeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ybE6TLXkR2uOs1A0XOgGgUR8zOB5QCwOEC9SXGGyumA=;
        fh=KPR0pIGPucjeu/qGWcXVAzz3woFNOS5bhVorxSO4aOQ=;
        b=XySDGI+7pkdXyOWeeC8Apaha7qwYutiWdkeNjS6OB1wlAQna5x62P0cbY32/qanNBV
         wJwaikWUfX2sp1BI/P7LQdaCt9L5aymC0MYqboe3UNCPDrB2PiQIz9821gTrTEIfqLRn
         pybcnmitMMjg/YK2BwadFV4PIa8Uwyc7a/WIKSKdDhdwQnoDOVElg2yY3BMRlG3KHPEr
         rIil4bbtEez26Jwd4QD8JdRiPrtj/rBmwgukmTgqiPkONNMUrDutYYNtII6IO5ky6Z38
         rxWPHy22NSQPZXAbCxJtRuNYDgQOFHgQOXL0r0odNVe7Yu4fJbN2lyH8oKt1/Ff35qQx
         OYSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769771855; x=1770376655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybE6TLXkR2uOs1A0XOgGgUR8zOB5QCwOEC9SXGGyumA=;
        b=YdqmmDEy8CYd+M7GsfKRb0hGhmrs1+OAUKSiajd+P4p18cVyZ/mRkNK9F3g2NBs00j
         stkeX6YWs7Pbnkp4XHtr8pBSWNUb/UyBNq0QSuaPB7uqczCkQlbKzrH9mNIX8CSeCx8C
         bwR3VStbV5pFlAkm3/6C6yRAJgQMJ/P9NKNSwAJOU/9A4QVWw8eDnfcg+flBgAZHbUd4
         aawF+sQFZvdpGuI27Gj1Vqg0b12gOvEiWL0TgBTm0OLmixaEiA0jCxsM0oBZxOLbdhMX
         c20Sq754XGrl7SfzuBBQXRiSwkCji+wvLVgCxGJeTtTgxftjVPTnafuX1IDhxukDCeU4
         i4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769771855; x=1770376655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ybE6TLXkR2uOs1A0XOgGgUR8zOB5QCwOEC9SXGGyumA=;
        b=pydbv3yaH+CP0myfdY7EJ7kzF1NUEk9LjLmnwus/4Je5MIpyEaodz2ogpDkEwhjxV1
         AuIxUcRQ8N6+Gq20hmi2IPh7SLDEAJTa8GEusd2nVwQLMpG3Iick+9B50nPuQ9uCqrOt
         zjFV+rRwC4QJnq18g+WKz0srp1ObIBcWzc7WlKUCV5byP1CGoplLSdEWlVYe2eJKPkxo
         nvxrZKgCW/cmai9KLY2lLuwAq9erNcHrqCm1vIm5T2miCpi65eimCSB6kC31e/Z2cuyH
         HB2Sk0hTQ1o2fDW5UMClWiKt8zpAJP2445mmDujxSuNEXEaCIDBfcWaK+XQYNpgj7Dp8
         gDng==
X-Forwarded-Encrypted: i=1; AJvYcCUUJjo7d2IcoOAJpaGER6hX/bN9Uu/OchLJh7/nAHXHEZWrja0LZ3YcuUItuDmgl74JnX7KbUdkO2PmY+acXeT2+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Q4OeTSSnjFtYjGhuMmAzsbjssUDld4tM1O/ff9UYVMsrr8ME
	uvNRBAJvuhfgJvdvINfm2tcKqP2Zum9TUafl/Q/xppyoTplcR95MmywFYGLHWi6Xvi3Oq9tOWvV
	OzZkZHSeQT2EwGlz6mpl+Mbj4DiCCV2DDnzagOvw=
X-Gm-Gg: AZuq6aLvdnk3jnHm3kwa5AmCV6+vTYpwXhROr3rsMWN6YupB/K3ZC83Mn5UF3fBnVk2
	G3KyCV8pQoWowZ83xNt8IA/c1jmgotc61v2zWxnR2Mww/nrQl4aMcfK+d43hPPwYPQwnpuuG60x
	2XPu+nRqxeHMUEEmtZEhVxOlRa+9AAAZ3Eu5d4h1BkdGb6VasyrihmDLRomT2SzGQeuh1+kXB4W
	ThAX7qIZoTNYXF9SfD+yufe5pUv78WufkK0680SvHJ5HNK0HQLHWzlfPHAEHM2bv9DrC7mow1RM
	LgXU+jQcXS8y2NvfMRu+f/PB58AwtdlHdgya7wHredmVtpW4DQdj2GjPYv6OysysCyCB1gg79Wl
	GIWf2115RMfHCKvaniVnYWYk2
X-Received: by 2002:a5d:64e6:0:b0:435:9241:37c2 with SMTP id
 ffacd0b85a97d-435f3a7c031mr3752578f8f.9.1769771854874; Fri, 30 Jan 2026
 03:17:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260121150137.3364865-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87cy2wcqe2.ffs@tglx> <CA+V-a8trA53J5xt-p1odHkqeHgk_qXKQeXsf-QOfz2=JmTOSYA@mail.gmail.com>
 <87bjicm66u.ffs@tglx>
In-Reply-To: <87bjicm66u.ffs@tglx>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 30 Jan 2026 11:17:08 +0000
X-Gm-Features: AZwV_QhTbiF_Oo5dnEL0l0eoTSNtQr0S69GE8V4RWrNjV_NU86PPR4SKtXB-S3k
Message-ID: <CA+V-a8sjADs_=81h=5R1nEFt3LWVNuHS1y-kH6Z5ANNp0Sci0w@mail.gmail.com>
Subject: Re: [PATCH 4/6] irqchip/renesas-rzv2h: Add CA55 software interrupt support
To: Thomas Gleixner <tglx@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27661-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 918EBBA009
X-Rspamd-Action: no action

Hi Thomas,

On Thu, Jan 29, 2026 at 9:59=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Thu, Jan 29 2026 at 21:24, Prabhakar Lad wrote:
> > On Mon, Jan 26, 2026 at 4:03=E2=80=AFPM Thomas Gleixner <tglx@kernel.or=
g> wrote:
> >>
> >> On Wed, Jan 21 2026 at 15:01, Prabhakar wrote:
> >> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> >
> >> > The Renesas RZ/V2H ICU provides a software interrupt register (ICU_S=
WINT)
> >> > that allows software to explicitly assert interrupts toward individu=
al
> >> > CA55 cores. Writing BIT(n) to ICU_SWINT triggers the corresponding
> >> > interrupt.
> >> >
> >> > Introduce a debug mechanism to trigger software interrupts on indivi=
dual
> >> > Cortex-A55 cores via the RZ/V2H ICU. The interface is gated behind
> >> > CONFIG_DEBUG_FS and a module parameter to ensure it only exists when
> >> > explicitly enabled.
> >>
> >> Can't you reuse/extend the existing mechanism provided by
> >> CONFIG_GENERIC_IRQ_INJECTION (irq_inject_interrupt(), irq_debug_write(=
))
> >> instead of implementing yet another ad hoc debugfs magic?
> >>
> > Can you please point me to a driver which makes use of it? In my case
> > the interrupt needs to be triggered when BIT(n) (n=3D0-3) is written to
> > ICU_SWINT.
>
> Care to look what irq_inject_interrupt() does?
>
> It tries first to inject the interrupt via irq_set_irqchip_state(),
> which only works when a chip in the hierarchy implements the
> chip::irq_set_irqchip_state() callback.
>
I did implement irq_set_irqchip_state but it doesn't land in the
rzv2h_icu_irq_set_irqchip_state(). So I was wondering if I missed
something.

#Trigger int-ca55-0
root@rzv2h-evk:/sys/kernel/debug/irq/irqs# echo trigger > 14

#The trace looks like below:
irq_debug_write()
  -> irq_inject_interrupt()
     -> irq_set_irqchip_state()

This lands in GICV3. For the RZ/V2H ICU only interrupts port_irqx and
tintx interrupts are registered  in irq_domain_create_hierarchy() for
the rest of the interrupts these are supposed to be directly handled
by GICv3.

root@rzv2h-evk:/sys/kernel/debug/irq/irqs# cat /proc/interrupts | grep
interr | grep 294
 14:          1          0          0          0    GICv3 294 Edge
 10400000.interrupt-controller
root@rzv2h-evk:/sys/kernel/debug/irq/irqs# cat 14
handler:  handle_fasteoi_irq
device:   (null)
status:   0x00000001
istate:   0x00004000
ddepth:   0
wdepth:   0
dstate:   0x0b400201
            IRQ_TYPE_EDGE_RISING
            IRQD_ACTIVATED
            IRQD_IRQ_STARTED
            IRQD_SINGLE_TARGET
            IRQD_DEFAULT_TRIGGER_SET
            IRQD_HANDLE_ENFORCE_IRQCTX
node:     -1
affinity: 0-3
effectiv: 0
domain:  :soc:interrupt-controller@14900000-1
 hwirq:   0x126
 chip:    GICv3
  flags:   0x15
             IRQCHIP_SET_TYPE_MASKED
             IRQCHIP_MASK_ON_SUSPEND
             IRQCHIP_SKIP_SET_WAKE

How do you propose to handle this? irq_inject_interrupt() would work
if I move int-ca55-x and icu-error-ca55 under
irq_domain_create_hierarchy().

Cheers,
Prabhakar

