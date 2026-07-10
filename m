Return-Path: <linux-renesas-soc+bounces-35048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ch8LFH/bUGqH6QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 13:46:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B940273A610
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 13:46:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7CB7303E8C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B11421F1B;
	Fri, 10 Jul 2026 11:45:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E04420E7F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 11:45:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683955; cv=none; b=L04fHKlf4xE/XwyL9xk6bE7sfk48PTlVllu1XxrtojdWOqpvfLRa58JSBNDcSHzFWbYbFe5J5zz99FtwMqGLBFTYHIHlAG9Q2rqpvSk6bCcmy+jior0QgDmEDa67qcDBCGBzcozeoaBAWqTVlWI9BQnXHkM7d7XkrzpHa1V5Bl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683955; c=relaxed/simple;
	bh=EekNeqjV4N0gGnWuwGaCvsr4HCbdqEM0Tp8JVDwVAfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXbMctt783mhw/Yj6VmfLBBK1kqyCOwmLoCXhdYcCUoKpmsh5bIQU7AhZO/TY+g2+IFNMPog+KXBxmtKAHQmw8ZaimabhVC3cImd0e6SCTzoY2LVN+4B8tiRQosEk8Mwy2p5bqK6CK53XwCjYiklLasc3P5MsBVMfomVFREOlts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-73b909fbb6bso500440137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 04:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783683932; x=1784288732;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fwdk8OQjfZ4g1oKCi9DzVNLxPRzraPZCDq7l76gWtBY=;
        b=PGW88VDTfKFMR+ev328ELgmL9kotKTKwO6KtSHGU066Z1mOVTqPunWa0d4v9r1/Hul
         euiG8W+rKd84OES+T+6n/TTyBnPHnXhNELOBOsJlU/4OfuyyN9DGfH+xI7aUhyvhQ0Jm
         sotpCk9ntsBW40c/7cI8r4BV31cN+bent48mbzYjFy1SugIksmloJwCV2T/vRe8Rg083
         GQiWWt0iw+lxfXYC3Uj4yWiQeNmPAH5f+gXduoJJDM7bYIP0aTr+4R+qWbZ1vP+VADMR
         39FXkgiiBHtIOmFm91PizJz36fq87+psq7/del4MUQC5YU0OfRH5GUdOIaB/Q1saeMWJ
         POGg==
X-Forwarded-Encrypted: i=1; AHgh+RrtRQGpGTuEk4yGc0dR6vP/DX9XVCJD9q3/khuJ5CH36gJtlVZkimQ96Veq6AsxWKpfpocZu2UoQ6ZEaEmjP727Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTrniHu2Z4fO9NwrrtgaqQu//0yNE68UaRFDEpXIcl5mMAdLfj
	5qTeH0aphYFK008f0QyXnNFjU7pzk0scSBXBqa2g+lDOcbsQA/fXhAH0kx+EqOSGxcg=
X-Gm-Gg: AfdE7ckSqUkwo4zjY7dSoiukCs/lnDOx7I/MNAyhYkvlDpUXD3BpiqV+OqOkPRzQbSi
	zO61pLIBbdrONuO4LsgYlFe0vjwl7m2/DpbLKKjEEVPz/D/JOnLb7hM+SWRrx0aL0lOjMu2Z9hw
	VvsFoINm3rbGKSmZJ4i4PKs3QmNsGy3g+wjoYm0EyvVDha37Wjs2l5PQCypecos2KYvCht7Rl5X
	r+ocCCQSbKPsnlc/MwX9I09qqm86ZOYQq2Bsj1w8Jl8v3EL2aZPl/hGXd11cOdOMpPi9MHVIXVo
	xOcrkZlDzQLaZMr4ZQSTfY9fpk4btlO/s9XXtPjGKpT2mmUwF0D0yoZRfHp3jq8mU7ySejnwj8l
	ircF4IGKo0vh8Q+rjaXt6++2HsLli8TsTMQUSFRdNbI8zVv2Q1RD0ztMyDweQ1Texgl+XyBO9Vf
	lJmhBauA0HzDaOgAmoA4Xr6CQ0tkMRyVTrlmLmirArWRH+zTc6jQ==
X-Received: by 2002:a05:6102:1628:b0:737:80f0:7885 with SMTP id ada2fe7eead31-744e00f6d8cmr7454720137.28.1783683932514;
        Fri, 10 Jul 2026 04:45:32 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3e6a1sm4957589137.1.2026.07.10.04.45.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:45:32 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-737f6e70678so546238137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 04:45:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoaDWxUkqp+r2oVV8eGShIfwhrinSZqljx4yQzZciQmHrOYEFQlnqGFU/aH9Oi0RFZAVUiJ0IQGvXFKU/ew5oMswA==@vger.kernel.org
X-Received: by 2002:a05:6102:598c:b0:726:8813:2078 with SMTP id
 ada2fe7eead31-744dfebf3c1mr6762275137.11.1783683931945; Fri, 10 Jul 2026
 04:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113029.436415-2-manuelebner@mailbox.org>
In-Reply-To: <20260710113029.436415-2-manuelebner@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 13:45:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVN124Dnj3i70BpKaAAWCF4t1Anx2mBHXqXYXKWj2feiQ@mail.gmail.com>
X-Gm-Features: AUfX_myuyPuTjg5DZyr9KKKOqV5l0_ncCR0jCoB2bLPghzOOyFOUVx8su2-pqUY
Message-ID: <CAMuHMdVN124Dnj3i70BpKaAAWCF4t1Anx2mBHXqXYXKWj2feiQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: memory-controllers: renesas,dbsc: fix bracket
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35048-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:krzk@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mailbox.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B940273A610

On Fri, 10 Jul 2026 at 13:31, Manuel Ebner <manuelebner@mailbox.org> wrote:
> Remove needless ')'.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

