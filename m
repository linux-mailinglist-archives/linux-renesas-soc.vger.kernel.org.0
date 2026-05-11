Return-Path: <linux-renesas-soc+bounces-32363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBoPHailAWpKhAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:47:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A3E50B3E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6592C30508B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 09:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A4A3BD653;
	Mon, 11 May 2026 09:32:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9682E3A257A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 09:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491948; cv=none; b=Mpyk9kahhq+oQmJ6ebNv888yMKXIMPHwqzysSJ83PqmVro4Ffeg6L/OGpGtfoXFL7YmTFGImwzK5OH7CpBMp4vbYqkSRHpjv1fgOpwhI2kcnl8wTrjvzAv6iNwmjPqH1HOe7rp2E1erXBjeDnl8FynJBgA94ZGydkNVOlaOOaXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491948; c=relaxed/simple;
	bh=d9PSxFFxGUfO9bcu4GbUqyZO6ELfnJGEDw8k62X8+NQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=t6LElYX8rubOAB/WfGJHhvwC24x4sEHMZ6cEjPfZwvd0DwJvVTGZQ7AEDXOm/rxfBlb13W7Q51zucXUSvYozuWOCQM3duzv6Wf3ojAPtfWZ929z6D8qcelN0VXVOyoZ6XSmhKwSIwdK25KKX6eSFZhUmXCHATkWjDjvFP4xmv4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-632a055fa9fso376267137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 02:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491945; x=1779096745;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Nrzls/aY5F/88Jsnwy7xDyfA7Q7OHE0DPx4RzZ5fDw=;
        b=eleHs/jNQ0XNOu0uBdvaM3waqhpFWGQp5AKY8tNQ5+IQYdvwMe6CxIZNPPI4cC8OcP
         td4AigTGGMQygYlc+zifgY7u4l/AZqXRyzfRf43pvYML/UF8BAPpya8YiIKlIl02YHES
         XMPWZHSCr2kTOqbF3+LlgWIb4jLnQSEXmCquzEBZcy4Jgjce2I14xsM8Sa+ZskXuEnWx
         QUkDbnPBRWJC0waulb34lJ46Oz0LWB7nkiECpCclceCAGbtgQd0qVIN/K7JY2LGPLsSP
         HgJUnEZJ186t040LIWq4hyO2Cy7tHksFSNnlMvC3G30T2wK7lQzP+NYFo6Hy4qQOeCzF
         0bbA==
X-Forwarded-Encrypted: i=1; AFNElJ/5Bb3hKRYLKxKU4wP5eiyJZnSFOK7pT4lR/O67IewvWwIEUnBoQiTC930N4W9Gdy7mqPq+OfV9u0KFZ3wHjCnH6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKFcFOS/mpaVkjNbyME55QNuFpgFXUQcEHGFO3g2getikVMnnK
	0BkOJWVf3fQDUjEd2DdruxsmXQk0Z7zEXwSvUx6Jnpvq3pwgJPl/Ss5W0E2kX9Nz
X-Gm-Gg: Acq92OG5vWDJ0QGjAQ63H9I77ISvArq3zwmvZAq7vpIfxhfzrFytN+k2srYpKXE9IIV
	vrjXSDlFEZ6D22slcFegjYULQ8h/Q6jipNJLs7GlsNeFzxqEHAr96I1ba44zbSmCJegZQ7xXU3A
	W+cbGyXNWCWTpM7rXVgYBzz1YI9Jkjc0fT3/P98FdhgJBswV+TUjNIxrdMXSIpOfbrxKgJyV7wl
	Vgt2iEbMjxRxAFI8CtSUm6rk2BbskS0WNyTNtWAHAzXZVNWjHl804zlo+raukNg+jjg7EA3fv4o
	uzYGqylGQMlsHC7Fie5ZehyO+/Sy04SuoI/Qrd7pbcss9YfMO8IljWPlxq2MFHpMBz9uoff6rk/
	lcj/4p9veJe4ahs4AXcUyG7mm9YP9SG8v7QpV1SiPHv2NotkS493V8E9iVNWu+CXOzqvt8Y006g
	vz6crNEHgoRWZL9qtsP2HMwIYpGsPugoaQ+Gn0b87Q4J9LHG4MQCUA3e6RJyvmYjop
X-Received: by 2002:a05:6102:10dc:b0:631:ea6b:23e1 with SMTP id ada2fe7eead31-631ea6b2b6emr1846184137.23.1778491945398;
        Mon, 11 May 2026 02:32:25 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63140035928sm5656124137.4.2026.05.11.02.32.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:32:25 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-57533363201so1253504e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 02:32:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/YIJJ9pZTn/bOfLcTzfTH5c2G3aA1NwZRsouQoApYr++zYI47vBHNMns3UZ9gwgYHielbLYoJQyGq8Z9dmBiK13Q==@vger.kernel.org
X-Received: by 2002:a05:6122:3d08:b0:56f:2609:cd95 with SMTP id
 71dfb90a1353d-575864d866dmr5663907e0c.9.1778491944525; Mon, 11 May 2026
 02:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2026 11:32:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_Y6Sis7776SEjoPZP2NQ8sO7dUbWLF4oCZnWOWQy5vQ@mail.gmail.com>
X-Gm-Features: AVHnY4J6wptwE4Y5YbQ0RNvAcYZuakxv9GbDOHanQCgeHqKHbSOCIBpnNysMsU8
Message-ID: <CAMuHMdX_Y6Sis7776SEjoPZP2NQ8sO7dUbWLF4oCZnWOWQy5vQ@mail.gmail.com>
Subject: Unable to handle kernel NULL pointer dereference in percpu_ref_get()
To: cgroups@vger.kernel.org, netdev <netdev@vger.kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 82A3E50B3E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32363-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi all,

After merging v7.1-rc3, booting the kernel on RZ/Five hung.
When retrying with "earlycon keep_bootcon", I managed to catch the
crash report below.  Unfortunately I could not reproduce it after that,
hence no bisection result, but perhaps this rings a bell?

    Unable to handle kernel NULL pointer dereference at virtual
address 0000000000000000
    Current swapper/0 pgtable: 4K pagesize, 39-bit VAs, pgdp=0x00000000494f7000
    [0000000000000000] pgd=0000000000000000, p4d=0000000000000000,
pud=0000000000000000
    Oops [#1]
    CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
7.1.0-rc3-rzfive-02022-ge48a16cf2dd1 #515 PREEMPT
    Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
    epc : percpu_ref_get+0x32/0x40
     ra : percpu_ref_get+0x10/0x40
    epc : ffffffff80089562 ra : ffffffff80089540 sp : ffffffc60000bb10
     gp : ffffffff812ea908 tp : ffffffd6018c9a00 t0 : ffffffd601997800
     t1 : ffffffff80df6a2f t2 : 69676552203a5445 s0 : ffffffc60000bb30
     s1 : ffffffff81291f18 a0 : ffffffff81291f18 a1 : 0000000000000002
     a2 : 0000000000000000 a3 : 0000000000000001 a4 : 0000000000000000
     a5 : 0000000200000022 a6 : 0000000000000508 a7 : 0000000000000038
     s2 : ffffffff8128f4f8 s3 : 0000000000001000 s4 : ffffffff812c9978
     s5 : 0000000000000010 s6 : 0000000000000000 s7 : ffffffff812ee3f8
     s8 : ffffffff80a21e58 s9 : 0000000000000008 s10: ffffffff808000aa
     s11: 0000000000000000 t3 : ffffffff812fd06f t4 : ffffffff812fd06f
     t5 : ffffffff812fd070 t6 : ffffffd6018aaa7c ssp : 0000000000000000
    status: 0000000200000100 badaddr: 0000000000000000 cause: 000000000000000d
    [<ffffffff80089562>] percpu_ref_get+0x32/0x40
    [<ffffffff8008eac8>] cgroup_sk_alloc+0x40/0x6e
    [<ffffffff8055ae8a>] sk_alloc+0xb4/0xdc
    [<ffffffff805b7718>] __netlink_create+0x32/0x8a
    [<ffffffff805b984a>] __netlink_kernel_create+0x60/0x182
    [<ffffffff80584492>] rtnetlink_net_init+0x4e/0x7a
    [<ffffffff8056aacc>] ops_init+0xc6/0xf8
    [<ffffffff8056bc3c>] register_pernet_operations+0xd0/0x148
    [<ffffffff8056bce2>] register_pernet_subsys+0x2e/0x48
    [<ffffffff8082ccb4>] rtnetlink_init+0x18/0x54
    [<ffffffff8082d27c>] netlink_proto_init+0x11c/0x140
    [<ffffffff8080100a>] do_one_initcall+0x70/0x13c
    [<ffffffff808013b2>] kernel_init_freeable+0x274/0x276
    [<ffffffff806bda22>] kernel_init+0x1e/0x12a
    [<ffffffff8000d368>] ret_from_fork_kernel+0x10/0xa2
    [<ffffffff806c37f6>] ret_from_fork_kernel_asm+0x16/0x18
    Code: 00e7 20ef d9fe 60e2 6442 64a2 6105 8082 77f3 1001 (6314) 8b89
    ---[ end trace 0000000000000000 ]---
    note: swapper/0[1] exited with irqs disabled
    BUG: sleeping function called from invalid context at
include/linux/percpu-rwsem.h:51
    in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
    preempt_count: 0, expected: 0
    RCU nest depth: 2, expected: 0
    CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G      D
7.1.0-rc3-rzfive-02022-ge48a16cf2dd1 #515 PREEMPT
    Tainted: [D]=DIE
    Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
    Call Trace:
    [<ffffffff8000fab6>] dump_backtrace+0x1c/0x24
    [<ffffffff80001226>] show_stack+0x2a/0x34
    [<ffffffff8000b57a>] dump_stack_lvl+0x32/0x4a
    [<ffffffff8000b5a6>] dump_stack+0x14/0x1c
    [<ffffffff8003861a>] __might_resched+0x110/0x11a
    [<ffffffff80038678>] __might_sleep+0x54/0x60
    [<ffffffff8002382e>] exit_signals+0x1e/0x140
    [<ffffffff80019858>] do_exit+0x14a/0x642
    [<ffffffff80019e24>] __riscv_sys_exit+0x0/0x1c
    [<ffffffff8000f50a>] die+0xdc/0xea
    [<ffffffff800015d4>] die_kernel_fault+0x1da/0x1e6
    [<ffffffff80012d20>] no_context+0x38/0x40
    [<ffffffff80012db2>] handle_page_fault+0x5e/0x23c
    [<ffffffff806bc9f8>] do_page_fault+0x1e/0x36
    [<ffffffff806c36da>] handle_exception+0x15e/0x16a
    [<ffffffff80089562>] percpu_ref_get+0x32/0x40
    [<ffffffff8008eac8>] cgroup_sk_alloc+0x40/0x6e
    [<ffffffff8055ae8a>] sk_alloc+0xb4/0xdc
    [<ffffffff805b7718>] __netlink_create+0x32/0x8a
    [<ffffffff805b984a>] __netlink_kernel_create+0x60/0x182
    [<ffffffff80584492>] rtnetlink_net_init+0x4e/0x7a
    [<ffffffff8056aacc>] ops_init+0xc6/0xf8
    [<ffffffff8056bc3c>] register_pernet_operations+0xd0/0x148
    [<ffffffff8056bce2>] register_pernet_subsys+0x2e/0x48
    [<ffffffff8082ccb4>] rtnetlink_init+0x18/0x54
    [<ffffffff8082d27c>] netlink_proto_init+0x11c/0x140
    [<ffffffff8080100a>] do_one_initcall+0x70/0x13c
    [<ffffffff808013b2>] kernel_init_freeable+0x274/0x276
    [<ffffffff806bda22>] kernel_init+0x1e/0x12a
    [<ffffffff8000d368>] ret_from_fork_kernel+0x10/0xa2
    [<ffffffff806c37f6>] ret_from_fork_kernel_asm+0x16/0x18
    Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
    ---[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b ]---

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

