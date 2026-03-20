Return-Path: <linux-renesas-soc+bounces-30041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA0yG77avWlyCwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 00:39:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D80872E250F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 00:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B4133007964
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 23:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650F71C5F11;
	Fri, 20 Mar 2026 23:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzD+JS9D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD023921C9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 23:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774049934; cv=none; b=gwu4UVknCh+U7WoDANgHT56BVzXSV5IdAcpFbPKOiERFRdKMyFMATYT+ETcEe3O2buXwHKVGr6EUPdwWUXU+LzLB/J2hORMriuhqZgvIxgoI1reiKzjbufVcEWOogiFZG7Gls5irqM3rlHAg8i0O2a3VjszgWVGV1d+Aa0C8pzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774049934; c=relaxed/simple;
	bh=I/AI7KSp9hH+T571mnu4u8z+QfIPB+7v+TnCZPfe1gA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LrfDBoomNJ0715BLA4h+qyjunIdJfpiIJd1xrnwebmh+FNzAN/FN4ZxZM/iq5zxzCuQf+nmzddRBmQ1NnoPux813KRqBaCOUeZA4OuFGgJmlCwGkL7H9FnzKnOx4pwgDw1NEEJuOsPiu18+jkuEQLGaQRz47Ny7RsI+AUO8kqAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzD+JS9D; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-509061dab77so23299111cf.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 16:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774049932; x=1774654732; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPOeYfcd3a8RIxnu94gsrILewZg9g9bl+gIZgb4Msao=;
        b=jzD+JS9DcevWzj+41hcfu84tX5TGnCEp/rls4t/vMHUN4DEirl31UTSlZRwyWJg/Sf
         569oFCi49BD6VVjEBlVaKtxvmzL1vdQS65GpTOBGU0gNzBW3PbGMm0GVRZQ2+0AViQld
         UFRpmFoehmx7T/cBB0nQsx7CpSCMdBIgM9xzSkRShZBBpSsan2gUBws+nKWPXlDKBS+N
         mpbWFn3PGHd916d/YMYsnDgmyjj0qwkIeZzvesN0efdzS7/TaEM5HnTrZ+MRAdlYlgta
         cllmGTOFsmXHnozdUhuCaPiMGdHfbyscwMeshiAS0mcnDizReVzwdhrMGCkLABvTo90J
         ff8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774049932; x=1774654732;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NPOeYfcd3a8RIxnu94gsrILewZg9g9bl+gIZgb4Msao=;
        b=qLJJgFxC6xpIId5Ujf/2glRKdTQpUAWtX5sCj6CTUGKkUZBXjlpPu+JZOfhRcOy5W5
         Y4BHgoVnb2RQmcA50ZnDKl+AJwHT3VnR2HdPhN9PZLjFOLdmhViCZ3CtSvDuaNHfZXDO
         H50L42II66Wze2rymIsLnnNTo8iG+I7neme1atvRp/dpQxNeOyyfTGlUS1aIk7Ul+WaF
         bXoGEaXRRF/238QAFlfVvMDqDEItWYATFMf+yEG/uLYN6SgvD1gdKY+l/HvL5fs2M0TF
         9clb+HOI+oOulUC8nnTG7e/xA8/C0evjVFSJ/1QorVfh/kGY8cE9asQ4/cdwt0YnsjFk
         gMNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNmehIV8hmnX3M5LXeelnuuoj5Ruv2hTAyBzAuoJYTs6KJwYq8RRz9ln2tUXb9eDAgKw1Xv3DPAVDCUnrq23ztkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL6fAzM6Q7C4TfJUAm+14FO29hrTuvztYhyO/l7jeXm56q0SWo
	QmV1Y3BPYQNZIA9DNSJ5MO8m9l5FdOLn/SAGblw4n07pPLlYuCsOtJL8
X-Gm-Gg: ATEYQzyMKc0pwQ7gDimrgCkkknIaXp0ZRD0WkSYTCuMycc4gx8H95awgf37CkKOUXhq
	iOdJRvWxCgli3u5p0+6LiXYbOZpX3xE+KSpNf1B84hcjUK2diOn8ACw25X3loEKcXA3hrCjPbWs
	hO3RToxK906msUpbpccc6MItOZaKEf7+gDQJO0Z2ikv/YIM9qGJowntqK3WU+GNCrqA2NeyaE+b
	poT4VLCj66Zaf/19mMET8VQ8q0Or+D/9bPyGErCh6EH2V/i+9dAv98mjl5FzyM19G2UfDaSKJa5
	8FV6wnohWgUHylkR9BNJmV4gTxXJqgtZ7Pba1r5DZ93LDxrEWGrG2z3SGkiuPlcDPOhSQUKXhl/
	w03ZoF9y+/wRWeVx+ZPSecjZoMQy15bxHCkZ2pXcynnM+e3lZxMkVau6af6C1LTEskUzbzxdjT5
	xd9ijamb9QvRSafPpOlrXT0aqKDiybM93wHPQ3uPYOr/2eqG9PwQYPYrrLMEo2oqTjk4qBHa1h8
	tA=
X-Received: by 2002:a05:622a:848f:b0:509:61:b22 with SMTP id d75a77b69052e-50b37566620mr53148851cf.57.1774049932015;
        Fri, 20 Mar 2026 16:38:52 -0700 (PDT)
Received: from localhost (c-71-194-28-115.hsd1.il.comcast.net. [71.194.28.115])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36cb2e29sm35646841cf.1.2026.03.20.16.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 16:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 18:38:47 -0500
Message-Id: <DH807PW5SQCW.3AA422QQRGVAH@gmail.com>
Cc: "Peter Maydell" <peter.maydell@linaro.org>, "Auger Eric"
 <eric.auger@redhat.com>, "Xiao Feng Ren" <renxiaof@linux.vnet.ibm.com>,
 "Arnd Bergmann" <arnd@arndb.de>, "Alexander Graf" <agraf@suse.de>, "Magnus
 Damm" <magnus.damm@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, "Landon Clipp" <landonclipp@gmail.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [Qemu-arm] [PATCH/RFC 4/5] vfio: No-IOMMU mode support
From: "Landon Clipp" <landonclipp@gmail.com>
To: "Alex Williamson" <alex.williamson@redhat.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>
X-Mailer: aerc 0.21.0
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
 <1518189456-2873-5-git-send-email-geert+renesas@glider.be>
 <20180209085024.004b6f9e@w520.home>
In-Reply-To: <20180209085024.004b6f9e@w520.home>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30041-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,redhat.com,linux.vnet.ibm.com,arndb.de,suse.de,gmail.com,ideasonboard.com,sang-engineering.com,nongnu.org,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[landonclipp@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D80872E250F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Feb 9, 2018 at 9:50 AM CST, Alex Williamson wrote:
> On Fri,  9 Feb 2018 16:17:35 +0100
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
>> From: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
>>=20
>> Add qemu support for the newly introduced VFIO No-IOMMU driver.
>>=20
>> We need to add special handling for:
>> - Group character device is /dev/vfio/noiommu-$GROUP.
>> - No-IOMMU does not rely on a memory listener.
>> - No IOMMU will be set for its group, so no need to call
>>   vfio_kvm_device_add_group.
>>=20
>> Signed-off-by: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
>> [geert: Rebase]
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  hw/vfio/common.c              | 61 ++++++++++++++++++++++++++++++++++--=
-------
>>  include/hw/vfio/vfio-common.h |  2 ++
>>  2 files changed, 50 insertions(+), 13 deletions(-)
>
> NAK.  I'm opposed to no-iommu support in QEMU in general, but accepting
> vfio devices with no-iommu (which provide no DMA translation!!!)
> transparently as if they might actually work like a regular vfio device
> is absolutely unacceptable.  Without DMA translation and isolation, you
> might want to think about another interface, I'm not keen on the idea
> of corrupting vfio support in order to blink some LEDs.  Thanks,
>
> Alex
>

8 years later, I was wondering if we could revisit this. I found myself in =
a
need to use enable_unsafe_noiommu_mode due to some systems I'm using not ha=
ving
a usable IOMMU. QEMU is being used as part of a single-tenant workload
sandboxing environment, and given the specific circumstances, both the user=
s and
the administrators understand that enabling the noiommu mode is unsafe and
cannot be used where security matters. Regardless, it's still something we =
want.

As the administrator of my system, it's under my control whether VFIO is pu=
t
into this mode, and if it is, I would expect the remaning software componen=
ts
to respect that decision. As is, the system is unusable because of a lack o=
f
support in QEMU.

I'm happy to elucidate more of my use-case if it is helpful, but I first wa=
nted to
gauge your willingness to reconsider this under a different context.

Regards,
Landon (CoreWeave)

