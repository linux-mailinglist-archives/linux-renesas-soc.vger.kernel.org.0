Return-Path: <linux-renesas-soc+bounces-20975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89369B35E21
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Aug 2025 13:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40506687A13
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Aug 2025 11:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25A7299957;
	Tue, 26 Aug 2025 11:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OGb3eJS5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1F520330
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Aug 2025 11:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756209178; cv=none; b=jqMPCatUAxIJmk7SV+xtSijp0528KxyyUdObzPFXPruQNN2UMP7mz++v9RtHRKJp8l2xw4N5EfbkFbGHdEqDW+mZOIjipBQTHpP+f8OosyDArb7Z+WAYOyv1GmSAInLmuaV/+/+DxSOLP4JRDbJ0H+k8E+qnvaW7azfmOhDsDEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756209178; c=relaxed/simple;
	bh=GR8wOyKl4HbIY5koqYX6Qcxm/LL8C7IpL8DFj8Soc1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dmi9WkRT7hLaRQvtv5JP/OwZVAwpiI6Ys8n5L34XrDSZYs3JgfdPfLOUDbVrH45luk1S0uUCHG9aA86WBOxHYIs8L6ZP3L9NNzhJENxn0JxTVVsRot8f/WdCwmH4GE47KkcnGOtc9+CKk9Py/2B+FBcZ/HkaB5DzN4J0PsNMNgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OGb3eJS5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756209176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e53lcb42G3RVNhjNWPFwju1PJTH1cjj9lH1MqnWkPUw=;
	b=OGb3eJS5HaMnsnwILZORtvCVe11rE6PZnS8H9bto0aciOkEcLf1CBZycrRC9k3d6DClH6P
	EReDPPMTehSvJ8906fnKTmBswQALdSmVr9Mg7s2GgePM/KPR4jZ6eyg3HI6uzvm3FuSrnx
	1kp2Ij7LNxjyrO+IxWMfXdwblBncZ6A=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-5kduHdE5O3WNipOj7VYOmQ-1; Tue, 26 Aug 2025 07:52:55 -0400
X-MC-Unique: 5kduHdE5O3WNipOj7VYOmQ-1
X-Mimecast-MFC-AGG-ID: 5kduHdE5O3WNipOj7VYOmQ_1756209174
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e8704c5867so2063544085a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Aug 2025 04:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756209174; x=1756813974;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e53lcb42G3RVNhjNWPFwju1PJTH1cjj9lH1MqnWkPUw=;
        b=j7+aoPM4WvYS+C3hXbe+JIyFS/7lfsyDG1wpQvF1semA01zh2O0kiJ1lxCNyDVHPcS
         wyH70su9rav6pVrAAWOioqZaLf559ZbFek0iPQ9Qc0ZwgDlx7KnrwD5BngRk8kpRaoOn
         +rZxZWUUffsgyBgxLkWWBqfNUZYWg16tivB5jqUo5qRwZmsFCX7KcPIfikp2qIjRq1Zf
         wi5Ua+83ZcQ6f/DGaFnS9OJrwjIb8CSR9u7LLu9GVmHr/jk349E60MtvQGoUe1sdXTZX
         3i4o8k4qpIpq7k+XwUFDvc9f2NwEHbDmahZMKQURp7SpyrPUw4gxypRlxRplksVsTfxG
         pPpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0k80yKRbT/DD2yHaSpJLQNoyMirpuA5IcOZnRCQgy3lDFHCfXjTpUM0o3OLN7KMxG+xgLNiqvvQmk6+Efc8+47A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9QbKagLPM246QKu0TCKTBWUXI3rJfoI9AEAtPJ4MgfASvfTb0
	tgLbmV6dl0LlwTHXTAz4WYICxjW/uqu5auiIDlxDmtnoBFN6/BZmXmIcEeRci3wWcwgvtP1sfE9
	BrK5X6GPHfPV12G7kh0ur35GhZxNgwhurxKUwWZxpISj7WN6F2NgthuIz1OsQ3R2OvHQpeBN+
X-Gm-Gg: ASbGncvzGf48jvwLAocSdQyKJJK5aYjWreIBQXKWsUs31TAQ78aeqlVhGUn63podhiQ
	Zwqqo18+sMH18750A1ks9M72vPZCZ6fCjlRtd+8X1iVW0rh95rc09weGRVyFdoMENlrAg9R+xPQ
	8Mua2/u3tN5B27PWVa34uJVvxXIFRfn6B+33FwvG7Wh7t5pk3bDgd3cyeqVaPY+iLM5lviyoRIg
	BwyA1wS4vpmYygzqd2kpDgtV24Pw7n10IM0sry19KPbH176SBF6wb4s+/Sjt/t5TCmUIyZwwcBL
	BKsZl52MqqdhTeArma9+0n1jg0XfjmWC6LanD9+gRc1R2g9X8h9EbFV3XS3XY2QDFIHjoa+p1Ng
	/5hV6FwC0FyeY5Zv6u70=
X-Received: by 2002:a05:620a:a903:b0:7e9:f81f:ce91 with SMTP id af79cd13be357-7ea110a5fc6mr1545014485a.83.1756209174546;
        Tue, 26 Aug 2025 04:52:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEES/HvFR76larcT3Nn6nir0QLpsUJq2+C9kWe3HGsFZh8ETnB9k+QXuGo4sEteZ1xDZAs8Sg==
X-Received: by 2002:a05:620a:a903:b0:7e9:f81f:ce91 with SMTP id af79cd13be357-7ea110a5fc6mr1545012785a.83.1756209174056;
        Tue, 26 Aug 2025 04:52:54 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebecb1825bsm661572385a.10.2025.08.26.04.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 04:52:53 -0700 (PDT)
Date: Tue, 26 Aug 2025 07:52:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, geert+renesas@glider.be,
	linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after
 resume
Message-ID: <aK2gE0CysSWisFwB@x1>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
 <aKyX4YJswZLuqA6Y@x1>
 <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Claudiu,

On Tue, Aug 26, 2025 at 02:01:56PM +0300, claudiu beznea wrote:
> On 8/25/25 20:05, Brian Masney wrote:
> > On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
> > > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > This series disables clocks that remain unused after resume.
> > > This is necessary when the resume process is done with the help of the
> > > bootloader, as the bootloader enables various clocks when returning from
> > > resume.
> > > 
> > > On the RZ/G3S SoC (where this series was tested), the bootloader enables
> > > the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
> > > 1 is unused) and the clocks for a serial IP (unused by Linux).
> > > 
> > > Testing was done on the RZ/G3S SMARC Carrier II board.
> > 
> > Do you think that other boards would also benefit from this change? If
> > so, what do you think about putting the call to register_pm_notifier()
> > inside an __init block in clk.c so that this same change doesn't have to
> > be implemented across various clk drivers?
> 
> Yes, that was my other approach I was thinking about. I wanted to see how
> other people consider this version.
> 
> > 
> > Alternatively, if this is board specific, could this be fixed in the
> > boot loader so that the clock that's not used by Linus is properly shut
> > down on resume?
> 
> As a result of your request I did some more investigations on my side, I can
> say that, yes, in theory that could be also handled by bootloader.
> 
> I can drop this and try to do it in bootloader, if any. Please let me know
> if you still consider this (or the variant that implements it in a generic
> way) necessary.

Personally I would go the route of fixing this in the bootloader for
this particular platform.

If this issue affects other platforms, particularly across multiple
SoC vendors, then I think it would be worthwhile to have a discussion
about adding this functionality to the clk core.

Brian


