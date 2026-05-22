Return-Path: <linux-renesas-soc+bounces-33007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL4QNm5dEGqDWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:43:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 810E45B5604
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4953F3018D52
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934433C585C;
	Fri, 22 May 2026 13:33:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2483C4B93
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456784; cv=none; b=ZYL+OQKSdd3XF/vQm6WtWSZn3izQiQl5dBCZT0RKevrOEArnRrZ1rFCg/xLsfgNtobWEQa4eMG8gFbjye0VQ4zwgER13jg2VFvn83Pr7z1uWgq2TU8zf3m0A0O5XL76V8Cpu5+TDwtwIM3tw9e/umECBCvLgJQmWC+OIuMvYHbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456784; c=relaxed/simple;
	bh=oCVQeqNkgLC+A8DsyABQmEoKPm1VZ97E3MIdW+uHGTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMmXxGq6JpYIrzFvicAQk4fH8pbmeCH09MH4gT6Erx59WySyZtuxHjBrcCUSOiH2M1OVsvTYwK60q1xMkijqZqcdKziO8tgP/lw/yQb95o11oJxgDXYf7pOtM3MWCWoBO4C6tWMkMCoWrDtYOLR9jZY4ZU+AraIhqfrOgStO9Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5780c38ecb8so4952744e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456782; x=1780061582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=;
        b=JTb7zo7xbaTRtKPNdsSbJpBC8Udln3F5rUuwkXXlrU4ceuDKXzmOcuw8tdqCTlXGW+
         rRN+sJYv0AD8ZK7MamlnrIr2xAC76LlLAPvONNQnmrp2NDIf9tomNTn0FB+Atf6TcSni
         94VC8MVsITf80DSqc+PAK5/GYpUJRlxMsMF/sHQ3CIqiB55epwdMHOsDmPje9ZOCrxp1
         jl3Puw9YY+VR0nAf8TZZvO0xVcrOIOO77BRTBHL5LOgxYXBCgSddl5ka9DPizIth+RJG
         6ytpYF6Ps5ZpadSk9s1niLcYcrJxlo9S5EsF+xN7nEHOuA8v91xW0Bp1xAgAzPDp1GXK
         nISg==
X-Forwarded-Encrypted: i=1; AFNElJ+LTv8S0jZAk9/joGiMcMVp/2b1cMis1W838T//3sPb+2eevQqmDQCOLGLrC1mHaTUMe+PIQ43izu7WWjlHjfHkkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzokibf1xzbtKIXVKNxCo6ObN7QWfMOtkbBY9ClY/GWUI5MKeKJ
	DxyJmCGFYgGomsyzOs+MbcB1jQt4yoNxsqvo5Wp4jubQWmLcCfsk7wK1HTWR72baUCc=
X-Gm-Gg: Acq92OGWLZmTYjiqW062qryLKCzTsc1iLoN1A0qGa3eQFVDczOfm1fQX/CoK+STEd/Q
	VSUqwY8KRR5z7cUV4mrkLz5zkX1G8TKgh1/b+4xhEkwzj145ZBsR1cU1u7wqF2y/CXx6SM7gQt4
	fI773adRzxA3VlsQxxWPta0hKKmrSATBkRJNWSqor0TcVPlzJVVxBucDV7M3sFbJgj21NAIqybZ
	1Q4sSxgHchR5+noe7qy7KjgOM6mJ8WaiNDGcCJUNHZWrZMPHZAgHlSTiVuDW83nyJ2+X5nnEGZD
	njRCjw9b4oDXaewRsaPdS9jtVhZgEA8bbWCcsIlbuVgQTjLC1++cWw33Laf6ca5bN+G5fZyL+oj
	S5sI9YLnoDPQ40nN+kcpDjsxG8BRjGtkK4hvfBmHsU2cLMBDvmd0I3j/tnEkKUxmBCL3O8s19NG
	MIUTBmP9SQPXo1u22x2Rmi2h00BH7pNM/Fi1/OBVfKBE4+CPKqGjt4tTs3/VvAt5eYB+aInIbYI
	VQ=
X-Received: by 2002:a05:6122:881:b0:574:6c7d:ff08 with SMTP id 71dfb90a1353d-5865ea8bf8emr2025953e0c.1.1779456782064;
        Fri, 22 May 2026 06:33:02 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173842ed1sm1501144241.6.2026.05.22.06.32.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:33:01 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5771954bcd0so5200334e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:32:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+CWe3hN4Oa9wnMZN4265bwBvRK8SNk14pdef31d3pfbO3inrNK5xTzoxPeqPHeT78q3uf3hHabfJHBMyPMvzfohg==@vger.kernel.org
X-Received: by 2002:a05:6122:d07:b0:56d:8ded:796c with SMTP id
 71dfb90a1353d-5865f81d405mr1996416e0c.4.1779456779687; Fri, 22 May 2026
 06:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:32:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW29ihBqL4S6bzDVw5dAwYWXKSki9Nz=BY51i8NP5D=VQ@mail.gmail.com>
X-Gm-Features: AVHnY4LeG55-0Nh30AeZGnk8727WjXH176FAkQkG1GYU6MDB6SKJVQ3CS8IechE
Message-ID: <CAMuHMdW29ihBqL4S6bzDVw5dAwYWXKSki9Nz=BY51i8NP5D=VQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: draak: Rename clk-multiplier to clock-controller
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33007-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 810E45B5604
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 5 May 2026 at 00:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use standard clock-controller node name for the CS2000-CP.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

