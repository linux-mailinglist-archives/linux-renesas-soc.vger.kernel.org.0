Return-Path: <linux-renesas-soc+bounces-28917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GEWL/+ZqmkxUQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 10:10:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CC15321DA60
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 10:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9151230148A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 09:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AA71FC7C5;
	Fri,  6 Mar 2026 09:10:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF4419F11B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772788207; cv=none; b=J3F8bDe+T06CWlwSMqtjpcTMilZHfDqXztbr9sdkPqshyFfiKBwH4bZfjoWBomKdzJ6aVTj73GGa3yDY1d++K8YGpvhjhGrROI40HtlK1P4ILxMTOAVIWNAzoKcC0tO7rY6ju/bW9LMJIZQBjQKYDXph+ZvF3dALhVklShEWOzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772788207; c=relaxed/simple;
	bh=uwm0bSCXmxvpSNZUShveuIwJcCvk78nSTrVPBeuWho0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kmt3T6dRzfoV205wGQIf4sKd1xcNalbDQ26AMY3rMcbaSQrkbsrghaFREW9rrJrmBr6c9ZVT9f0icR6x4+hdqX+agsxjWw9xe07khxal2kgV8nUGMyxy5c7PzunKlKIg+seV/cU5bFCensfnLN6OMyroRQRALQQCW6e8GO2Dk1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94dddb3c3f0so2376697241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 01:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772788205; x=1773393005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3nZIv+ouWgmKG3C/K0jHTIxk5om4dQA+zY3E5ywYQ8=;
        b=kUeWRFdItGdoIRglOX/7ZRuRDGRRfvZ/BFuwEfD2vQQGXN70o1iM2tHMhBH+zmH3CL
         FtG+5JP80cCspsX4bT/CAgvUNiAF6hmAXb90TFQ7iueb/D6on2V1mbd4ILiIf+O5F/2C
         c8BjUPusIe8kISto0hk4lrfLvMjz1Zj9IS4ns769gziEldRDhCgqGbTWyKErnI0im1hg
         CgYzPCOnEkkAFoPkZpoqj5LprF6CAhOaCv5tJfPW9F+f6qXyasf+RAb0Pm0UyzbW/7WT
         xcy+hIXMLqf3peZOndD9yDpo0S1EUJ3P4HDVwspldv+pjRru8yzJgJJ5K8gOw89r6klT
         ptNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrWdFZBoPIMAvO6K2i5H9n81r/NBNEvSD1JDq5ijVXH3YBrlIyR8K9vOWnfimTlLc7HMP/K0EJ4kIToYcYujAV0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqhhfejyvms35NbQYYg++rf/16mW3UrJ3TRSL+f/MAqCn/0BSz
	rbFYyPFz5elHeu8+hml1Qoy9LP8f7PheqygM9gFvjO+X4imxSlbji/a7Bmnk7pCWGQA=
X-Gm-Gg: ATEYQzwbYVUdfTOpTRCQ/nhoFw8fZLsz0t8bV4PnylBX6dKB4Ci2LJlVXeSDdDFDRHq
	SLVbWQ9wjN8IFbHGGtqn7FbWrL9peaYJzV4DxFjlprz2LYtx/MrbwXDrhdEQHQekJFXzf1o7kk3
	KlZMl9oq8z5gbxdEK2bf5fJvGfMH880eOr6wwrJl3ttEdPWJlMU7Oq490Jap/QxldUYcJSl6L4k
	JUi2mIRPx3n0DPkiur+oV/4Gxdh8CekQcO4bo1CRMBCs8b311s5jRQiLL1ZWcCYFWpj/pcYOueD
	OAGvN++xLDOueJ2eWG80ng8jhVNWgh5qq0a+PBPTgetQiz4vFletSr/RbkbKzzQ3s9LPXADOmF8
	K4hg5Nv89qzEAbSRrAIQmySt3klNgTzTv9BqfVcLEF/NqrYsTiZew1H7cu6tegSnZCDIE5lLzpI
	pl79n1n8f7wuR5STq5Q46TXIP2ZLbH+FHCzjsj7ljyGubYIjgTg1dAJ0ceaOWsk9Q5
X-Received: by 2002:a05:6102:161f:b0:5fe:626a:a51b with SMTP id ada2fe7eead31-5ffe5f89dcfmr438382137.14.1772788204876;
        Fri, 06 Mar 2026 01:10:04 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ffe88aa2d6sm835910137.2.2026.03.06.01.10.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 01:10:04 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56af73db66bso591859e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 01:10:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUV32zuDE2c8FQNXkKjVaSeqkWuHklIixM8Jod+12qEYoFnd6/nnRRfSZ8Twg+UJtOY+S08knENW47CUe/vpIpTCA==@vger.kernel.org
X-Received: by 2002:a05:6102:161f:b0:5fe:626a:a51b with SMTP id
 ada2fe7eead31-5ffe5f89dcfmr438378137.14.1772788203846; Fri, 06 Mar 2026
 01:10:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d42ba403c1fb1aca88b82ba3020ad0ec442a455f.1772705608.git.geert+renesas@glider.be>
 <20260305193152.253dc267@jic23-huawei>
In-Reply-To: <20260305193152.253dc267@jic23-huawei>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2026 10:09:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtNPU8fhznYmgnC_55xdqdd545eD5nHtiw_P4AD1v69g@mail.gmail.com>
X-Gm-Features: AaiRm50dI1vKfZ-T0zEsv62f5Tr9uck-3NrMp4NLVNXCnJh4Ix6huEV-NMCebHs
Message-ID: <CAMuHMdVtNPU8fhznYmgnC_55xdqdd545eD5nHtiw_P4AD1v69g@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: rzg2l: Convert to FIELD_MODIFY()
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: CC15321DA60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28917-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Jonathan.

On Thu, 5 Mar 2026 at 20:32, Jonathan Cameron <jic23@kernel.org> wrote:
> On Thu,  5 Mar 2026 11:13:55 +0100
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> > Use the FIELD_MODIFY() helper instead of open-coding the same operation.
> > This requires splitting the double OR operation.
> Hi Geert,
>
> Looks like similar can be applied in
> rzg2l_adc_conversion_setup()

Which case did you have in mind? Note that FIELD_MODIFY() needs
a constant mask, so it cannot be used with e.g.
hw_params->adint_inten_mask.
For non-constant masks, we first need to introduce field_modify() ;-)

> FIELD_MODIFY() is useful to shorten code, but if we are using it we should look
> for all good opportunities in a driver.  Please check to see if there are more.

I did a full scan, and it seems I did miss RZG2L_ADIVC_DIVADC_4.
Will fix in v2, eventually.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

