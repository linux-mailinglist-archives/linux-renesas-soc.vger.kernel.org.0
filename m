Return-Path: <linux-renesas-soc+bounces-33909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W2iZHhLSK2rNFgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 11:32:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7658A678514
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 11:32:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8BB03019338
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 09:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AA13750C4;
	Fri, 12 Jun 2026 09:27:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD81D30F94D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 09:27:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256474; cv=none; b=TanM7ItsJuOZZaHAMYOlGndk8JuwT7F9vmTGE9zMQOhz9uPv7uj6ZKHiTqI//SXgiD1wxyjBps55oU6JYIzw1ZUzfgfqh+/1nkA83zAaNstnGPGj0slLk2wz2Yu+Rr74uSCPdg4qVMApEBL+CPUoIBgbmhY9qPVt0I35AooLU8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256474; c=relaxed/simple;
	bh=rw8Tvs+tqVHlE1yz/4QqXObm6oY6UdP3I1/O30mTwAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WpQon+Fs2cbgNG6CVxOF5l6iWsoUWHiPk8Zhe58QTMt7iQGQOAzUWW3d8nEDkdoXTSIAqfoATbiTLa44vjXTABLmxPHifXbUQSS8pD7k+e0+n5SInQcMijimSJMSr9Nw68WJGE2CnVxfaBFbrTed13A5L0cKvhdASZzOC682eGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9639d7daff3so444950241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 02:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256472; x=1781861272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSZwYOeTmzPIFgGHYKIxzTEqMNY8O4D81LGf3X98Xhg=;
        b=c6vvdjSMkVtOHGX+3ZR4LowmK3trwzC1sglODr1e4XUxoqw/K4+P3Stpc9yEvVHJRa
         t6DtGnJvPzOZeJ64YzZxIhNoxhvopyUtMdEMnMZHXyaMqi+TGYu+StlW9wCsdRcXn/op
         dq94LYIUwhMxwRBhvsMtKMr38+HWy28/4I5yw9XTrRqfglxUZYavDpYbxtzZgpqRImcm
         rzbtkeDhdCVjHwb44HjCYWct9IU4tbq5p2ftF1RK1IIH3IE1+WLzeI0LWeFmzGD4sTPV
         N5h5izUzCxXwLpoZ9J1YbYXGMSiaN0k3VMAiBgq/Mn7OtgzWIN0g8zguhJrKu8/JMfcp
         uN9A==
X-Forwarded-Encrypted: i=1; AFNElJ/GV+OaEtpv3ruD7B9uabJzaKQs4TkVqt5mlFragHla/G3Pi2GjWNTV3uu4MZi1Pnt3Kek3L/ngrazarRbTRVXfRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjRVo0cOpdQrKkcsO62k3SGnMWy3X9yVpQd7g52GZwsGt4YHIO
	Wzs4m17oaeUeQlQyWEb1L7L0zZ71rtnc10W53pn7hD4kWBThBARHwB8FZhvrouGu
X-Gm-Gg: Acq92OEKKd6hXh5gn/44vpZmET/0lkfa38GN/cOVcwPp2e3x3rw42s3STK0h3vZUEB0
	pTfcrIL17y8QwjYsByAy7I5jBTkNvlsC3yhIHMILGyDHuVcCb4oWevMSwe1kQrTytrqwbIprM77
	thNZu77uBnL/mIH2Q3DwFCjB6Bh7f1chb4XzTXbUhxV1q2lSG79pub34XdT7J0+UKriOtbwzxCU
	GP6Pp4dFGN9mlHP/TU2wPL5YQ2u0jucfj87T7/iB9Cg5FA9ldIqvHrnaLs5ePWmO/uXZUT9BZh0
	T+mLfzkshveq3myklpaVH2l8dc5Un2gZoVX++Q1rH5dAVxM19XxC+lE8KUchEuj2iD2z1C69IXM
	twzXu68OnuvDRTtn3cyDCZpN/VNnK9HhpTwWC7nebASir7pU/zSU5uJR+JF4p4wfc55CC+Ew1oY
	ci4VZGAjvdK2V0ZnLEGl0MgoZ8x4hPjuU8WfC3ChnVXmmZHgat/uBqUHGKUxu5
X-Received: by 2002:a05:6102:644b:b0:71b:e02f:65e2 with SMTP id ada2fe7eead31-71e88c8401dmr810979137.20.1781256471700;
        Fri, 12 Jun 2026 02:27:51 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96673eb0e3csm993499241.7.2026.06.12.02.27.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 02:27:50 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9639aa8ca17so456201241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 02:27:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+xmunzOCNC7SpuZZgKfDnfE65j+aVDMPUXqKzyoI6OAvZNzJGF7FthVj1U4UuoQnbJ3ZBd+ugGw6CUwfJCz747ng==@vger.kernel.org
X-Received: by 2002:a05:6102:1626:b0:610:1c78:9531 with SMTP id
 ada2fe7eead31-71e88dcdcc8mr852032137.24.1781256470532; Fri, 12 Jun 2026
 02:27:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
In-Reply-To: <20260609113836.45079-3-phucduc.bui@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jun 2026 11:27:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
X-Gm-Features: AVVi8CfaZvz-9jhnktf26BGxmAFl5Vd7m2Fjtdz0B71l3uBx6X_lEfTe-t2LChA
Message-ID: <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
To: phucduc.bui@gmail.com
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33909-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucducbui@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,glider.be:email,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7658A678514

Hi Phuc,

On Tue, 9 Jun 2026 at 13:39, <phucduc.bui@gmail.com> wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Add the SPU bus clock, icka/b functional clocks, and xcka/b external
> clock inputs to the FSI device node.
> This prepares for subsequent driver changes that explicitly manage the
> SPU clock required for FSI register access on the r8a7740.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

I have one more general question.
arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts configures
audio for FSI (fsia_pins), but does not fill in a clock-frequency
in fsiack_clk.  Instead, it fills in 12.288 MHz in fsibck_clk, while
the schematics call it FSIACK.
Apparently the FSIACK pin is shared with FSIBCK on R-Mobile A1, so
which function is used depends on pin control.  However, the DTS does
not perform any pin configuration for this pin?

Note that I have never tried audio on Armadillo myself.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

