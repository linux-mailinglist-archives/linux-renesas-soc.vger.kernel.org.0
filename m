Return-Path: <linux-renesas-soc+bounces-29527-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBPqFXVLuGlTbgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29527-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 19:27:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D6729F04F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 19:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58D43304707B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 18:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C133DBD7E;
	Mon, 16 Mar 2026 18:26:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261DA3DBD59
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 18:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773685592; cv=none; b=qxG6AInKWFuaqkeBMi13o8LVfyv00/XoATU4/7sNZqc30eB8qVG2IaoMAzEDAQALiAn8VVPztTQPGv1OccSR3+vxXMDDOMAvG6xPtlnXsHsAB1TqKIE8d74s5opoWIiS70pOTd664bc4n5WDOj0RsA35qOaR6+w8Wuw27ulRNYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773685592; c=relaxed/simple;
	bh=eLT608Iu65e75yFDY2ephL+DnmrFksL+EdNUoRvOM1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3sjyuKMma6/38Y7rReOrWwMz1BIoIkzvjymsraMx3p6WKxOo3MDhZTra+0pSrNQ9jdyUrCjzEoY9CPUw4My1kqB63YsWhok3OazHqjV2v6NdyHLwWJDnj1Lv525LE7b/pklKqBdZ6PsU7/1VwdootKvLi16m98gCD8VtoVZZh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-950b801b75fso595985241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 11:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773685585; x=1774290385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpQ1JDIESkHS70bwkrVznor7mYifAlL8o6+MvzPijrw=;
        b=H6stAHx/ifCW58opb9CnF5BH84Y3XsfT4iJn2S8WQPnbh6PiYLGQIqEzZrm9FHUENQ
         kOiqrzj73DaP74LCUo5V1cH+msPH0ku81XchgQucQVJRK/pwsfYI9lF/6qgNdqvVOt1S
         U7tnb0k+xp9WsDp2dPnG/1n5uOYUdltM9qpEQpFP+yyZhEYCxnmt5kvHglkKqjSlZnz6
         Y5WKt+V4kEQAitpOw8EBl1WjGQ+pV4CWg42I8vMwVVkjVWQDLhSZIuvQgbt5MR0/ckcU
         t0GHmBRGbngvtVCWBSA15Fxqj54EmgfB7H4gyLooy3Jjzql0fmv6pjhSnInQmfLxRiFq
         kJKg==
X-Forwarded-Encrypted: i=1; AJvYcCWFLCK2DQkcA07hHyzzmn1Kn608kBBFxTZcr4tnARmc/nj3l95zbz1h/Six98buB6bRzJ/8g+vOYhFbITrWoP24NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVcw/6ewmwYOeZWQQgAyeJ9i06CKdmB3TAaUYZQVJQK5NwOOp6
	AfPuVRhy4uwwVaUtWwd8ft5hFVFWB9Pp3mFw2u19j9wo9oTtZ10GUQPm1wQkPEIg
X-Gm-Gg: ATEYQzyAzCEDhMYjEG2AMUCpZItP+twbRZIMF6b9853GX6VVhSA3/zle/Me5ALBTDgF
	s9V7wa88YD4wJ3mCvKl/cAyKT4hLLJOtQe3SYaiaDouJ3EKERh2R68jPc37JzZkZXvcn+Yoc2fm
	kJ5FGE8WoJpBSBBfaUTJ3d9iCT3Aya2DX6uB+84W1DqTKgzxU/kzfhJF3CyVEpvHvjOqivIAC88
	2uPOlgIoeM7bUYfRn4idKR5rq9Hef9htRwQXY+8TwNGDKRZB5PIutQPRVqC0Ff38zecDZ4cOx7a
	lwIwZ5VVdvtMVr2N2l86N36wnTk/mCTDpDyWNP8n5CvTD82+ARTAcydsnvZLFd0732iyR5tJsRL
	3M/fNAu7ID9eUfABdztqPIr1eV7r2KG++WBmB3L+me5SBK27RMnu4P/bOQdZB8QlnknpH6I9BGa
	HGyOWmjwrsMlEGnk2zz9iwlbRsB7+CJ5i/ZUxhm6KlmzQft6tyN6Eur5htzV/9ctF+HJAsM5YjG
	Ow=
X-Received: by 2002:a05:6102:d87:b0:5e8:1d93:921a with SMTP id ada2fe7eead31-6020e2823b8mr5824552137.15.1773685584879;
        Mon, 16 Mar 2026 11:26:24 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecfc9c9fcsm6092016241.4.2026.03.16.11.26.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 11:26:24 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56b71eef805so831422e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 11:26:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6vlTfvt40U6KmiMM4mPJu14EpFtflHcFKDBgTPSooAVpTOKmAciGFrBdLLTdMepKhArba3bnhI8yGibUAdmB2Pg==@vger.kernel.org
X-Received: by 2002:a05:6122:6286:b0:566:2711:d8ab with SMTP id
 71dfb90a1353d-56b628474b4mr4749468e0c.6.1773685583889; Mon, 16 Mar 2026
 11:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130122353.2263273-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260130122353.2263273-2-cosmin-gabriel.tanislav.xa@renesas.com>
 <aaqTVDQa7xn70bR_@monoceros> <TYRPR01MB156191C8E77BDA44AE23A7D4F857AA@TYRPR01MB15619.jpnprd01.prod.outlook.com>
 <TYRPR01MB156192CC838EC0B3DD66246158540A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB156192CC838EC0B3DD66246158540A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 19:26:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVqqGTmxiKRQBbphw8KmtG66HLaZhDVvtSK81cfiMsXcQ@mail.gmail.com>
X-Gm-Features: AaiRm52-cBzLFzQh3BVzaTMxkTLnHu9mSUGosGUtI9IHFak7XQqS486mq62zz2g
Message-ID: <CAMuHMdVqqGTmxiKRQBbphw8KmtG66HLaZhDVvtSK81cfiMsXcQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] pwm: rz-mtu3: fix prescale check when enabling 2nd channel
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, William Breathitt Gray <wbg@kernel.org>, Lee Jones <lee@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,bp.renesas.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29527-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.871];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C6D6729F04F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Cosmin,

On Mon, 16 Mar 2026 at 16:52, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> static int rz_mtu3_sibling_hwpwm(u32 hwpwm, u32 *sibling_hwpwm)

Unused sibling_hwpwm?

> {
>         if (!rz_mtu3_hwpwm_is_primary(hwpwm))
>                 return hwpwm - 1;
>
>         if (rz_mtu3_hwpwm_is_primary(hwpwm + 1))
>                 return -EINVAL;
>
>         return hwpwm + 1;
> }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

