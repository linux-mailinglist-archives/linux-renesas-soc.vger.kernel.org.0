Return-Path: <linux-renesas-soc+bounces-22768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F23BC234E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 19:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 618014E11BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 17:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3251E1A3D;
	Tue,  7 Oct 2025 17:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBe+1HPw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E495E1C69D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 17:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759856441; cv=none; b=OLMTmZoDq/Neq6+CoQt+rHIQ3U7LjwBe/m3w3/Xh8AEifOHyJgQv3JHVRm1FROiXECtVRcSAF/gaTFEpsYK2VCIsoFOX7UqH7aT0K2gXHtqrJ9zuNSoWKSa3o/eNvJvsZI8Kkd6gBZ6S1uHZOwRw5W9IVSJrkrwRqKdRJcoyihs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759856441; c=relaxed/simple;
	bh=rXWQjNSy1vP89PAn1bfL5mZZUhr3rO9NsXeUs7rIPVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdGfCe/uNaN/q6bx8u0zE/ple+NAtYEeGuuGW7dhjq/6Txg4GnEsld8j/nxQC5f0tL9GJ/3b0HO/oxtDlq0YV0OFTs2t48mh/+CUzfAwhy7bSfFCoyl2fVS0CmzUrSTZx8M3Wstkz4a7scFk7PcrF52XMMR/hlBp+AA0IXjpGJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBe+1HPw; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso5735698f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759856438; x=1760461238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ym4ACn/vcSY7ocN8OqBZ0n11ubn4K6E18ID3rdWF4w8=;
        b=fBe+1HPwzak354DizhUpQMy+opMr60WBNotG8JOKMXGwKLWCKGza/Y0vFcCF4kQXRH
         e6ueKs4yTJ+kQqaR4eJHQSsJb//BD0Wj1Q5csFm/GRHuYrlCDdeb8TMAIs7scle/KKJo
         9RS0nx5oUwMimbwpRu7Hvl6L6iXFFgCCiXtpUQe00ImhWq4gRGhPK3qkx/aUBqWvqNiu
         C4QaVE4x0kql0B9ugOFtyT+NL8CUqpMbfzSidfDe1MgfOM+2dUYkqCc6rF7J9Mf2Ptkj
         Tiy3fY9VeLdp/3YqXT+sflrFdQYfhdWHeBKKqVUUOnlVQeJMAn3bnXeOqAJZ5RGg8m78
         ulhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759856438; x=1760461238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ym4ACn/vcSY7ocN8OqBZ0n11ubn4K6E18ID3rdWF4w8=;
        b=eoWw28JqjUKMg/DFWrInWxlhqxUZxO4HPl2QSE1RcWK6AO3XA1f4mwsyVncpOU/HQs
         Gc6vd3OvS2sB3VUU5Ua3ABgIxSIUo91pwhwASzcvzUl/uojmlA/BwfTWno53dJ3X8092
         k/MgPvFJ8bU2rw0B/IpcvPgakk37GX42oyOqnWc8SuIL9LS691QOW6T/nIhzJbEZbro1
         isRQpHQDFokSO1PzAWVxpz8Va8jaFo19+PEuYcvqXhqVj+ZdT6frlXGW/ZEHa2d6RAP6
         Q8eOGfyElYDuRFVfkLXej/VXA+ksRvDAtK6K7G4ZAZ/yN7YVixOumbbRgjW5NJuuKxMy
         4kzQ==
X-Gm-Message-State: AOJu0YygoMvas5bI+StbGCRD29KFOA5c+2IQOMzClHomarwL9uC1JCEr
	z9EzXhKIzOMtOlxukhLqfRoxvwmKqgpVVZSslEIeA3ramIbTJ6H27dFY/XGPaHrWpxMakPcLi++
	M1wcZnydlzBNvfiu2r8N6/xG+/E8wVATKCrYH
X-Gm-Gg: ASbGnct1VIUW9BKe3TQhyzOLQMrMjYvybu6j0juGWz0Jbf/bvAwB40ADgQCeqBfNZt+
	HNKbVq55bDLz+2AKHbMOdLNbAlgvke0bshIUHZJlarVCncgVwH+/KZ8vJs1ftiovz2R7tvFeLG7
	F4+JeRtBmxXyFdzLmNqVKBCz1LAKap2TUUl4UnxRTtgPf32959hU3MIongcSRZ6jTAlU/efvAJc
	pfXSujbXh2I3L95W7hPZGS7fDVRxvRu
X-Google-Smtp-Source: AGHT+IEZc4GDIOJHK1wn5+XQ2MUXZlQkKowMXBC0E8B9jeS2NGwXFd0nrX+D1w3NacTQUdJ94hPVUZALFtaDPlRqQNM=
X-Received: by 2002:a05:6000:2c0b:b0:3ff:17ac:a347 with SMTP id
 ffacd0b85a97d-4266e7e11c4mr23903f8f.27.1759856438010; Tue, 07 Oct 2025
 10:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+V-a8tWytDVmsk-PK23e4gChXH0pMDR9cKc_xEO4WXpNtr3eA@mail.gmail.com>
In-Reply-To: <CA+V-a8tWytDVmsk-PK23e4gChXH0pMDR9cKc_xEO4WXpNtr3eA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 7 Oct 2025 18:00:11 +0100
X-Gm-Features: AS18NWA3CoeVQkz908Z8HvCmJPrmSkqybX3sqr1XSi1vdYVk2WT1UvI8bJuIO3o
Message-ID: <CA+V-a8tsPGJMru-ui4t_Bd_0+be2eBFU-2O=nGM2rrRL6ja1sA@mail.gmail.com>
Subject: Re: CPU stalls with CONFIG_PREEMPT_RT enabled on next-20251006
 (Renesas RZ/G2L & RZ/G3E)
To: netdev <netdev@vger.kernel.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

On Tue, Oct 7, 2025 at 5:40=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi All,
>
> With CONFIG_PREEMPT_RT enabled, I=E2=80=99m observing CPU stalls from the=
 Rx
> path on two different drivers across Renesas platforms.
>
Just to update I managed to replicate this issue on a different path
on R/ZV2H which uses the STMMAC driver (Logs [3]).

> The first case is on the RZ/G3E SoC using the STMMAC driver:
> -----x-----x------x------x------x------x------x------x------x------x-----=
-x------x------x
> [  173.505971] rcu: INFO: rcu_preempt self-detected stall on CPU
> [  173.506014] rcu: 0-....: (2 GPs behind)
> idle=3Dde74/1/0x4000000000000000 softirq=3D0/0 fqs=3D2178 rcuc=3D5257
> jiffies(starved)
> [  173.506077] rcu: (t=3D5250 jiffies g=3D2757 q=3D79 ncpus=3D4)
> [  173.506118] CPU: 0 UID: 0 PID: 290 Comm: irq/107-eth0 Not tainted
> 6.17.0-next-20251006-00001-gaef898d60052 #19 PREEMPT_RT
> [  173.506163] Hardware name: Renesas SMARC EVK version 2 based on
> r9a09g047e57 (DT)
> [  173.506182] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [  173.506217] pc : rt_spin_lock+0x40/0x190
> [  173.506280] lr : stmmac_tx_clean.constprop.0+0x80/0x7a8
> [  173.506323] sp : ffff800082883a40
> [  173.506338] x29: ffff800082883a60 x28: ffff0000c1eb0a80 x27: ffff80008=
2883c18
> [  173.506397] x26: ffff80007a330000 x25: ffff800082883c00 x24: ffff80008=
173a000
> [  173.506447] x23: 00000000ffff8479 x22: 0000000000000003 x21: 000000000=
0000003
> [  173.506497] x20: ffff0000c1eb8580 x19: ffff0000c1eb8580 x18: 000000000=
0000001
> [  173.506545] x17: ffff0000c004f800 x16: 0000000000000bfe x15: 000000000=
0000000
> [  173.506593] x14: 0000767bd1d30308 x13: 00000000000003f8 x12: 000000000=
0000000
> [  173.506641] x11: 0000000000000000 x10: 0000000000000000 x9 : 000000000=
00013c0
> [  173.506687] x8 : ffff800082883c88 x7 : 0000000000000000 x6 : 000000000=
0000000
> [  173.506734] x5 : 0000000000000480 x4 : ffff0000c1eb0000 x3 : ffff80008=
2883b67
> [  173.506781] x2 : ffff0000c1eb8598 x1 : ffff0000c1f21140 x0 : 000000000=
0000000
> [  173.506829] Call trace:
> [  173.506843]  rt_spin_lock+0x40/0x190 (P)
> [  173.506905]  stmmac_tx_clean.constprop.0+0x80/0x7a8
> [  173.506948]  stmmac_napi_poll_tx+0x6c/0x154
> [  173.506989]  __napi_poll.constprop.0+0x38/0x188
> [  173.507041]  net_rx_action+0x118/0x264
> [  173.507088]  handle_softirqs.isra.0+0xe4/0x1ec
> [  173.507149]  __local_bh_enable_ip+0xc4/0x128
> [  173.507186]  irq_forced_thread_fn+0x48/0x60
> [  173.507240]  irq_thread+0x188/0x31c
> [  173.507292]  kthread+0x12c/0x210
> [  173.507337]  ret_from_fork+0x10/0x20
>
> The second case is on the RZ/G2L SoC using the RAVB driver:
> -----x-----x------x------x------x------x------x------x------x------x-----=
-x------x------x
> [   70.821322] rcu: INFO: rcu_preempt self-detected stall on CPU
> [   70.821351] rcu: 0-....: (4970 ticks this GP)
> idle=3De2c4/1/0x4000000000000000 softirq=3D0/0 fqs=3D2622 rcuc=3D5112
> jiffies(starved)
> [   70.821366] rcu: (t=3D5250 jiffies g=3D6729 q=3D98 ncpus=3D2)
> [   70.821382] CPU: 0 UID: 0 PID: 101 Comm: irq/45-11c20000 Not
> tainted 6.17.0-next-20251006-00001-gaef898d60052 #19 PREEMPT_RT
> [   70.821392] Hardware name: Renesas SMARC EVK based on r9a07g044l2 (DT)
> [   70.821397] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [   70.821404] pc : rt_spin_trylock+0x44/0xd8
> [   70.821426] lr : try_charge_memcg+0xd0/0x7a0
> [   70.821442] sp : ffff8000820cb3e0
> [   70.821445] x29: ffff8000820cb430 x28: 0000000000000001 x27: 000000000=
0000800
> [   70.821459] x26: 0000000000000000 x25: ffff00000bda1140 x24: ffff80008=
185f3e0
> [   70.821469] x23: 0000000000000040 x22: ffff00000cc7e800 x21: ffff80008=
167e600
> [   70.821479] x20: 0000000000000820 x19: 0000000000000002 x18: 000000000=
0000000
> [   70.821489] x17: ffff000009c3e580 x16: 00000000000003f6 x15: 000000000=
000000c
> [   70.821498] x14: 0000000000000000 x13: 0000000000000014 x12: ffff00000=
bdba800
> [   70.821508] x11: ffff00000bda8000 x10: 0000000000005114 x9 : 000000000=
0000000
> [   70.821517] x8 : ffff8000820cb588 x7 : 0000000000000000 x6 : 000000000=
0000000
> [   70.821526] x5 : 0000000000000000 x4 : ffff00000bda1140 x3 : ffff00007=
ddda618
> [   70.821536] x2 : ffff00000bda1140 x1 : ffff00000bda1140 x0 : 000000000=
0000001
> [   70.821546] Call trace:
> [   70.821550]  rt_spin_trylock+0x44/0xd8 (P)
> [   70.821564]  mem_cgroup_sk_charge+0x2c/0x80
> [   70.821572]  __sk_mem_raise_allocated+0x1cc/0x380
> [   70.821584]  __sk_mem_schedule+0x3c/0x60
> [   70.821592]  tcp_try_rmem_schedule+0x88/0x48c
> [   70.821603]  tcp_data_queue+0x2b0/0xe1c
> [   70.821611]  tcp_rcv_established+0x3bc/0xba0
> [   70.821619]  tcp_v4_do_rcv+0x1ec/0x2b8
> [   70.821630]  tcp_v4_rcv+0x954/0xf20
> [   70.821640]  ip_protocol_deliver_rcu+0x38/0x1a0
> [   70.821648]  ip_local_deliver_finish+0x90/0x120
> [   70.821654]  ip_local_deliver+0x7c/0x124
> [   70.821661]  ip_rcv+0x74/0x128
> [   70.821667]  __netif_receive_skb_core.constprop.0+0x928/0x11b0
> [   70.821679]  __netif_receive_skb_list_core+0xe8/0x210
> [   70.821688]  netif_receive_skb_list_internal+0x1dc/0x2d0
> [   70.821697]  napi_complete_done+0x80/0x1bc
> [   70.821705]  ravb_poll+0x170/0x1e4
> [   70.821715]  __napi_poll.constprop.0+0x38/0x188
> [   70.821723]  net_rx_action+0x118/0x264
> [   70.821732]  handle_softirqs.isra.0+0xe4/0x1ec
> [   70.821746]  __local_bh_enable_ip+0xc4/0x128
> [   70.821753]  irq_forced_thread_fn+0x48/0x60
> [   70.821765]  irq_thread+0x188/0x31c
> [   70.821775]  kthread+0x12c/0x210
> [   70.821785]  ret_from_fork+0x10/0x20
>

[3] The third case is on the RZ/V2H SoC using the STMMAC driver:
-----x-----x------x------x------x------x------x------x------x------x------x=
------x------x
[   62.140291] audit: type=3D1334 audit(1748544553.272:34): prog-id=3D26 op=
=3DUNLOAD
[   62.140347] audit: type=3D1334 audit(1748544553.272:35): prog-id=3D25 op=
=3DUNLOAD
[   93.215241] rcu: INFO: rcu_preempt self-detected stall on CPU
[   93.215283] rcu: 0-....: (5337 ticks this GP)
idle=3D8a44/1/0x4000000000000000 softirq=3D0/0 fqs=3D1817 rcuc=3D5425
jiffies(starved)
[   93.215346] rcu: (t=3D5250 jiffies g=3D2757 q=3D101 ncpus=3D4)
[   93.215387] CPU: 0 UID: 0 PID: 302 Comm: irq/114-eth0 Not tainted
6.17.0-next-20251006-00001-gaef898d60052 #19 PREEMPT_RT
[   93.215432] Hardware name: Renesas RZ/V2H EVK Board based on
r9a09g057h44 (DT)
[   93.215451] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   93.215487] pc : rt_spin_lock+0x40/0x190
[   93.215550] lr : stmmac_napi_check+0x124/0x1e0
[   93.215604] sp : ffff800083353c70
[   93.215618] x29: ffff800083353c90 x28: ffff80008173e1a0 x27: ffff0000c0f=
99cab
[   93.215678] x26: ffff0000c206e800 x25: ffff0000c0f99cac x24: ffff0000c26=
2a238
[   93.215730] x23: 0000000000000000 x22: ffff0000c2629e40 x21: 00000000000=
00008
[   93.215780] x20: ffff0000c2629c40 x19: ffff0000c262a238 x18: 00000000000=
00001
[   93.215830] x17: ffff0000c004f800 x16: 0000000000000bfa x15: 00000000000=
00000
[   93.215879] x14: 00002d68a20f4c12 x13: 0000000000000050 x12: 00000000000=
00000
[   93.215928] x11: 0000000000000000 x10: 0000000000000000 x9 : 00000000000=
013c0
[   93.215976] x8 : 00000000000011c0 x7 : 00000000000015c0 x6 : 00000000000=
00000
[   93.216023] x5 : ffff0000c2629e40 x4 : ffff0000c2629e50 x3 : 00000000000=
00030
[   93.216071] x2 : ffff0000c262a250 x1 : ffff0000c264a280 x0 : 00000000000=
00000
[   93.216121] Call trace:
[   93.216136]  rt_spin_lock+0x40/0x190 (P)
[   93.216198]  stmmac_napi_check+0x124/0x1e0
[   93.216255]  stmmac_interrupt+0x94/0x160
[   93.216295]  irq_thread_fn+0x2c/0xb0
[   93.216348]  irq_forced_thread_fn+0x34/0x60
[   93.216399]  irq_thread+0x188/0x31c
[   93.216452]  kthread+0x12c/0x210
[   93.216496]  ret_from_fork+0x10/0x20

Cheers,
Prabhakar

