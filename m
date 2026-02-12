Return-Path: <linux-renesas-soc+bounces-28177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id III8OqIfjmk+/wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 19:44:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1203513064A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 19:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA521300C57B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 18:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DCA2877ED;
	Thu, 12 Feb 2026 18:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlGbxhf2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9014A02
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Feb 2026 18:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770921885; cv=none; b=nZTEEbOyDsMcM964mhFHDxqXTSSW4hBvhiE6bPCNekTKpf3E5v27l5cLUWnPjZT5fGvNtlDG4OiJW1uzOoYxJ+H/K5yluCCQtNI0JvJ6RH0ujxUX0hyAiXoqo7/Y7X97U2J8Vit72Ta2cRMtCcLGyzTBLs8JWI3nF0nB12U/mfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770921885; c=relaxed/simple;
	bh=TLr7Xz7J+QMHaUJJHB/f6wXGwqzv0T7QxmkAVsEpQs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwH/nKHUM3QlvlFURXl2bDSJT+pEiAO4sagKMEAnafJ7TqNU3u0+dcFL0RJVSsbwU872zQkWEuteRbDxVgcEBHE/Y78YooQW+/30FeTJ617C1beyT+J7wXr53bysyHuSVjKbC3hAaeiGoERyOQBoL7VXUS+rrA//1Db8CnwOouA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlGbxhf2; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1270adc5121so332826c88.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Feb 2026 10:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770921884; x=1771526684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f37EbsIX7Fwq2gmEwPUE6uD06P4To39ry9mVkkXdhXE=;
        b=IlGbxhf2osnSoTZUDgEoRZ48fVG/pAvmk3fFlEOYcRLN2p3CacsMKMRaYNIOTstKBL
         ufcks2SlGEJDiMfstdyoX0DEqO4tOIkjRxa+hUf2wlepCYIAgltPrwJYbHxZKLDOL5qa
         xG1vpqZgVWZr6WuP6svm12WFsOGf2a9jxMrpCna45ILwgxUzp/+LKxWX4FdpQHoZEPjJ
         ur5o6orqhoHkYugDAqJ0EiptiraMXmgaft71cuSBm+gaz9j9YUwPvZhVhZokFIkQcDZD
         6Bkr0wMGNpuNUnubFekiBWWRbfbgJ83fzgW5gXCGRI3ZmZrse6kRAOmXoAhJW0uOBbVR
         +Kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770921884; x=1771526684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f37EbsIX7Fwq2gmEwPUE6uD06P4To39ry9mVkkXdhXE=;
        b=HLwoCk7E+88089o9JfWPoLm6Y/Vrn2EEKaDBuSi/mimHdxLdLkTq8igYFzAxx+OB7f
         62x1M06cfXwVnouGUPSv9MFfoe2P6KLJFV6RgC4Pj7+3eAxzHvBjN3wCZ0frVZzeR98/
         l0HCH5/uydgeDiitp5g9sLBZpaIi3wG2qssXvnSPL9XHG09pcOrnlpJCAsjXyfbsis8Y
         n705xeby9bNuPVZexUz2TvTm47RGDVdfoJ4G9fvSsec3cskTJ7SkUUep5fkSs4mVrLg8
         9ImVYHx6NuMSYvCuAGFnJVzkQXVT/EnOonEMY7vKlEGOnI9X1rkfiO4CHt4sZciPVEid
         pN3g==
X-Forwarded-Encrypted: i=1; AJvYcCVD4YEOOKYlaGBG8dNascSFMByV37FkG3xR6ZfPBZoiowx7ErhudXENrXDSqsqGa/XjkgEPVreBsyxgW47ga5gN9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywanm85Vj5nhbIUaM2b0T0IJtOvWQY/oXn/u7Hq/WQmD9odMz1M
	y9J4IFIjshynysJKeRpsDGQqayXa2bUU4MP6YIzwT2cTvPFz0mgJuM12
X-Gm-Gg: AZuq6aL8saGmma5EwD4Gb0cbIwKmYFhuVRsCgWyZhRwEiWoNkldmNfXzjXU7KFTMLlO
	gAmhDZ4rsOcUI03H+SXfGi1TU1v0nQVIdkHDGkGftKMk5GNC1COeVOymxl1nRagMnaVJeg6TRF7
	jITulsPzxXvBbo1DgQcl24ahIcJ2/HvZdg4NxpKTdB5+3F1zO8HgY+XMJnQ64sObCE2UlyqMi1p
	IsBreOlSGJus8YbQLEkXZVYlPkTi6Wr5AinrbqNqVogLkJwPSVLeAOnrLZ3T+y4wxDeHVddB+y1
	EA/COHGC1VtQVWe5b/rESKENMaF4ilkCCyObiO07kZugwH8OdjfKuEl4RjKKNsVNS3NibN8Pd1i
	mMifQmPz9+ZLks3mm+heZ+IHf4be668HbxgDg20WjBGyhnkXUJxg2nt0sYpQJwh8lSdUFlqi8ul
	ZbcybaNk0xcO31N9vZdFBKAWSSEvklwz0+diMNlMXBttm57P8UQ0+LHwT1yef136Vw
X-Received: by 2002:a05:7022:920:b0:11b:9386:8271 with SMTP id a92af1059eb24-1273059ecfamr1328253c88.46.1770921883727;
        Thu, 12 Feb 2026 10:44:43 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:7027:6cb0:48e2:2882])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a6e944asm4630977c88.9.2026.02.12.10.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 10:44:43 -0800 (PST)
Date: Thu, 12 Feb 2026 10:44:39 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-input@vger.kernel.org, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Cheng-Yang Chou <yphbchou0911@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Marc Zyngier <maz@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] linux/interrupt.h: allow "guard" notation to disable
 and reenable IRQ with valid IRQ check
Message-ID: <aY4fdWbsBAuoavgx@google.com>
References: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org>
 <87sebrbenj.ffs@tglx>
 <701e739d-2e82-40e7-87b5-b4ec92903af6@mailbox.org>
 <871pj9alui.ffs@tglx>
 <1a2db366-a611-4454-a86e-cf7df9cbc358@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a2db366-a611-4454-a86e-cf7df9cbc358@mailbox.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28177-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,infradead.org,gmail.com,nxp.com,glider.be,huawei.com,oss.qualcomm.com,linutronix.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1203513064A
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 03:33:03PM +0100, Marek Vasut wrote:
> On 1/28/26 2:49 PM, Thomas Gleixner wrote:
> > On Wed, Jan 28 2026 at 13:23, Marek Vasut wrote:
> > > On 1/27/26 10:14 AM, Thomas Gleixner wrote:
> > > > disable_valid_irq is a pretty non-intuitive name if you look at it just
> > > > by reading a usage site. It's not really improving the readability of
> > > > the code, it's in fact obscuring it as the reader has to actually look
> > > > up what the hell this means and then stumble upon a completely
> > > > undocumented lock guard define.
> > > > 
> > > > I'm all for using guards, but using guards just for the sake of using
> > > > guards is not a really good approach.
> > > I wouldn't even be opposed to converting the ili2xxx driver (the piece
> > > of code in patch 2/2 of this series) back to simple enable/disable_irq()
> > > . I am not particularly on board even with the disable_irq lock guard,
> > > or more specifically, lock guard used for non-lock things like this.
> > 
> > I agree that guard() is a slight misnomer for such usage, but this is
> > about scoped auto cleanups, so using it this way makes a lot of sense
> > when the scope mechanism is sensible.
> It is indeed a misnomer.
> 
> Would you prefer this patch be updated with some better function name, or
> dropped outright until there are surely more users of this functionality ?

Maybe call it "disable_irq_if_valid"?

Thanks.

-- 
Dmitry

