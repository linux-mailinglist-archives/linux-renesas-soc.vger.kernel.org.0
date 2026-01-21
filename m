Return-Path: <linux-renesas-soc+bounces-27173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB0+OelicGkVXwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 06:23:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8118D51778
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 06:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E774B4F6F68
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 05:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB513A7E05;
	Wed, 21 Jan 2026 05:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEPjFqFR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED783A7F52
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 05:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768973018; cv=none; b=b6qvCt/mHKa6mUR4u9957Reds26vLUBQYoELjtlix4HbM4avW8uvRtr9OqzAGRXyHvOGn6zqFC694JKb23crypUyrkU8YsHpRH/1a7zKS3yJOVcuuFyJVqibUsAfXnRHGnF3L1h8zJ53DqMZBjwxIGdiaAUS9zHjyu+59PFxZaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768973018; c=relaxed/simple;
	bh=Dw9HsdmJOjzl+Kv7hLQdOCfLXTyunVYFcP72pCiv2D4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sljPrJr3N2RQk/4KozcZJ9WhIOQQxCHdRATT9NL4Zp/LZovYM9naT2lNhZXZAOMYoYP7aANsOtILJ+a1guiBY7aEuUvJNEF+UnK5blScz+j7VUf/6VQCOi91ki9wHoAIJivwiQrBPZocTk5QqMLSkSkaIUNanUL1Iu9Y+AdtsNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEPjFqFR; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b0ea1edf11so11722902eec.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 21:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768973016; x=1769577816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7xHJElSAdSqvbGqx9RRBRVuePrz2/MCvNfCaMRCbPdA=;
        b=PEPjFqFRghO1tmToodI9M6hMlNh3UmQVP4M4XujxRrWcReM1xzsFqk+fhRNQeOXwyG
         qZeb6l4g44wSdY828zaMOqqV2sCt0iNAXw0xS9lK2eOFEpISnzxYRExmPPkefliqKifY
         HJoBbGELDC3fYpH26mAgSgXPjBh2mZh1KGXnjr5zmkWNHVdzQtKxUhT6BiualpPxCwWZ
         OLb6tjCFDC/JCWE6hEhzKfCU5hU5Ld9cOncB07LDxR1UYvVLFpdng8OeQ+mlhDXTcmuo
         xGB8/oq+Uz4q3uqVoKRQf0QiuPFlsM7h2Whc57r2UnuWIrPI0bOGuhB8FPtM57tUbo2A
         0F4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768973016; x=1769577816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xHJElSAdSqvbGqx9RRBRVuePrz2/MCvNfCaMRCbPdA=;
        b=SDE5Puxg0oJ51P9h4qb+TQ4JQw/ROHP25ZSHxMQ69JHBaGCd8bXOCD3OG1RxpdUjFv
         z4XgPUjn8Mt9gFQO7WH5gH2nN5InfDEySZRaqbK7JRrvFk1G+183OkQIaUk/5/4CP97h
         wlPorbk8u5ATI7xdgAyCnzQzH2qrSlG+YqgUWe/mcqD3iYsql4zt+2QoG12m8HJsVRJ3
         ql0fEqjbxGG+YfcdRPg2Q0P+tDfbJB673s4BGjK7xf/mrv+KMfYfUe13m1/891d//33K
         qtDXe9XeRZm2RcFrUCDXQuc1aeQsLj7vH/b3aR1pYWf63vOllFzQU32MhfP3w713VTnZ
         QjCA==
X-Forwarded-Encrypted: i=1; AJvYcCWvhBT3a6FVEF2fN1VcKU2BF3tmzwYHg8vXYuN5AGomymguayi48Zg9ZCBrtcl70yKMvkjKjAvjp0qJ/SfNRPvRhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfzTJKQT4/f2dMxdDkVTFfWmWhwYaaBbSaGiCTiAhnavLICnNU
	JTLpS47ag/WptDruVdefn5du5A9FnF4KHw3EON5/kw68QsRx+zr8Q5r4
X-Gm-Gg: AZuq6aLMRDowQS91xdKgcTRRDzc5sH0cb8kpSG/F3dLc79THMI/kprl1RgWDtzCFmmb
	czDZVp9TIla9XHG0DIS/+NhI/FZh4Ojw6NLrZe6L1tMFDj2n1bm2D1kBZrypv6d9Dvq7eVEsz2P
	2aWBonjiAbVHPsGC1oofxjwBewr26YhLHaE+fLNiFqK64Cfn0VdBwoqmp8L5P21Xi/+f7/NQ3gg
	55Gr0qV3EyHHsPrtETMa3y3hFDe9frUet7mYgbUjKFijkqw20tx3/pEB1PAvaMn6P1+O/iUCzR8
	78DLdwxuMNhtZIdITSpBvMiiqV38rVYswF93YdmNz4qTS5hWCrZCBuj9k1SQvPhhIP6bei6/ita
	2YMbvzaByPTtWzkacn4fe7oGBgSKq7T1nzLbxvrixddsDjlywq4VROgDlh76kTJ1Ma6Bfswk9Tw
	Z1lqm5BbrsdMwIF/yEGZxiFVMV1VYDgZSord+EvkPN5i8ozTfJoWNgo6tO3NIQrPw=
X-Received: by 2002:a05:7022:4399:b0:123:3bc6:1ff7 with SMTP id a92af1059eb24-1244b3700a5mr10142956c88.27.1768973015688;
        Tue, 20 Jan 2026 21:23:35 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:abb8:3a31:328a:3594])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac57fd0sm22877361c88.3.2026.01.20.21.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 21:23:35 -0800 (PST)
Date: Tue, 20 Jan 2026 21:23:32 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Job Noorman <job@noorman.info>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] Input: ili210x - add support for polling mode
Message-ID: <nk5qn7ye44lbtppp2opa273ut7lxkcz7jsw6giagwngiwhg7rr@puexvdzd2ymq>
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
 <20260117001215.59272-3-marek.vasut+renesas@mailbox.org>
 <wv3vil4b4lgfrqt4qnzxiffnniw422xjfdiz4svkklnfrslz3g@yzqc265pj5t5>
 <bbb7fb54-5b04-4c38-840b-8cab58eeec7b@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbb7fb54-5b04-4c38-840b-8cab58eeec7b@mailbox.org>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-27173-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 8118D51778
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 11:50:53PM +0100, Marek Vasut wrote:
> On 1/20/26 7:31 PM, Dmitry Torokhov wrote:
> > Hi Marek,
> > 
> > On Sat, Jan 17, 2026 at 01:12:04AM +0100, Marek Vasut wrote:
> > > @@ -860,16 +893,12 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
> > >   	 * the touch controller to disable the IRQs during update, so we have
> > >   	 * to do it this way here.
> > >   	 */
> > > -	scoped_guard(disable_irq, &client->irq) {
> > > -		dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
> > > -
> > > -		ili210x_hardware_reset(priv->reset_gpio);
> > > -
> > > -		error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
> > > -
> > > -		ili210x_hardware_reset(priv->reset_gpio);
> > > -
> > > -		dev_dbg(dev, "Firmware update ended, error=%i\n", error);
> > > +	if (client->irq > 0) {
> > > +		scoped_guard(disable_irq, &client->irq) {
> > > +			error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
> > > +		}
> > 
> > You already have a scope here, no need to establish a new one:
> > 
> > 		guard(disable_irq)(&client->irq);
> > 		error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
> 
> This part ^ I do not understand. If there is no IRQ defined in DT, I need to
> call ili210x_firmware_update_noirq() without the guard because I cannot
> disable_irq() with client->irq < 0, else I need to call
> ili210x_firmware_update_noirq() within the scoped_guard() to disable IRQs to
> avoid spurious IRQs that would interfere with the firmware update ?

You do not need to use scoped_guard() because you already define a scope
in your if statement:

if (client->irq > 0) {
	guard(disable_irq)(&client->irq);
	error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
} else {
	error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
}

This is sill a bit awkward. Maybe we could add to interrupt.h

void __disable_valid_irq(unsigned int irq)
{
	if (irq > 0)
		disable_irq(irq);
}

void __enable_valid_irq(unsigned int irq)
{
	if (irq > 0)
		enable_irq(irq);
}

DEFINE_LOCK_GUARD_1(disable_valid_irq, int,
		    disable_valid_irq(*_T->lock), enable_valid_irq(*_T->lock))

and then we'd be able to keep the driver as is (just adjust the type of
the original scoped_guard).

> 
> > BTW, not a fan of the "_noirq" suffix... Maybe drop it and add
> > lockdep_is_held() there?
> 
> This part I understand even less, how does lockdep play into this ? The
> scoped_guard() disables and enables IRQs if they are available.

Ah, sorry, brainfart on my part. I got confused by _noirq suffix.

Thanks.

-- 
Dmitry

