Return-Path: <linux-renesas-soc+bounces-20968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB10DB34834
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Aug 2025 19:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BD477B1E70
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Aug 2025 17:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5826F3002B6;
	Mon, 25 Aug 2025 17:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cYazCprx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FA1286D75
	for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Aug 2025 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756141546; cv=none; b=F3f09kmRuT3iIwb7bQURIBIUYVzfZ33ujFJsC8siq8GixfbE4vDJlQzC68+q08Fye1D2ndu5gHdqtDyDGBZhtHAf0mRqaEC9bOp4i2hadxH782HcX2zYhF9F649u375Ynk5i3j8gyrNqNowPP9NZim1JWO4PbPDna/mbnguy7og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756141546; c=relaxed/simple;
	bh=a9DEbmQDFs1ppjiAWwlvOY2MAO6FzDy9K1E/Pyjmmhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQnSVMQdUxeAC0puc6BjE8jTdepLcYUduWUm6ACJTc6b7hAJy4S2p4jakAyw7oVrb4sH42LgUzEkbQSnbCIjcWEBJyTUSt8nkJJ1XZVePBMGK0262cEQv4PqxYXpjol6rB7iRgXOGqYMlPQYKUQv5qTxoUL72ntElRbYnMU27zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cYazCprx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756141543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvfYaRBOsqgg9T3AWRsCKLpVkMgeI8wkL7WYk9/VCmQ=;
	b=cYazCprx42BX0fEeZkwW84GGNgUABkLY1mDCwnmi253D9t9OhCu+kgPea/SbLVCWXht3+G
	+B/ERt/f/80P1uDYefXYkaaCWETy33DrQDqrZ717K/vx8xXomOzEPBwgudPgU+a3Y+eYj2
	CC5+Vb1Lr/VtSJbgImMNn09aCvC7MIc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-nXy9oWUcOSOV7Oc2QjqxCw-1; Mon, 25 Aug 2025 13:05:42 -0400
X-MC-Unique: nXy9oWUcOSOV7Oc2QjqxCw-1
X-Mimecast-MFC-AGG-ID: nXy9oWUcOSOV7Oc2QjqxCw_1756141541
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70d93f57930so118428356d6.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Aug 2025 10:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756141541; x=1756746341;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvfYaRBOsqgg9T3AWRsCKLpVkMgeI8wkL7WYk9/VCmQ=;
        b=n0vO5D0pR997dhA3MxGDGlHCH8Kvp+sBOnZPJ9rWxEvWshJt7BT2KSJDL1v2XZRgqh
         Q/A+rXK2PKwJBX0vZjf7QQ2nG1isE7yJJX0GHLIGCSWfOI2gS6JWIk3edi5gr2R5TkNH
         N8kNQmXMAIgzy1QUzHrj+53qRo5F0qzcIn85XLHEv5nfPpfY9/i45iIz24RRqvWD3lRe
         +f//1AcrbydivyLsLnZAgi7T3KoBgE77qaTFAVLYaYVp7bNG3JiTJjslrlP0BvdPRDNi
         2+48zq2siJZ4YgZFiXaWdNlQb2sysnrjbUlSXfrK6QYW1n0gxaovnrSNT4Wpp8tpOHOj
         sRNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9cqBsRq0lGTzbgV9ns2nlmjkgd3UY5LT+lEsSprja/ukJy4ZYzpzWZt6NIK+kNCCp4EUOvHPRL+1tcRFo3+8vVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbODE560cgUE+URbO3eXcKsAGdtenSCiIs6IlpCiC4pulrENO8
	pZfOpVqXEkLtJmHK2ha8smge6lSMHZvLKWP0tL9BjmFPmHShqXw/fUTSbVjSwl15hf+8ex3mZHx
	ql+ojW1sJZSKzb9E0MeJpb2W493PUovhheSjuv+0Bu298PzXocKB7tcti6W9TrxLBSkqm3vJx
X-Gm-Gg: ASbGncv0nWbincpyVw0p8PbIKNTAJFj6URAgWcRBqyCa5eI4H3pD8NMPSk2+nexhI7J
	q6jhEUtGV2Ot73d0r5FIonSzJt7PPZcrYscwk9bIV03VVsm0vmD19wt6/vhuBchiDCLMwabiDMB
	npO+aNQvMyZKA125qAQ3EJ6d5zPclZNCgFQbIuivQMTfFfh4lf9OpQonD/sF3kniD+ZQ9Om179/
	Iet8VaeDy54ksVCKa0MFQZjxBAnMOrQWGTJ72bjIVFUop4PYHXVnNkRYEvbw5ZdwxE1QoW5N+Vn
	RYYIF31z/z5Vvr4mThNMi5bCngIoQFnPtwJtXv7t6QEf4QU4BDinWxCi9+HL87L3wunJe6smqTi
	QPDQdtB57JJ/d9VOyWlE=
X-Received: by 2002:ad4:5ec5:0:b0:70d:ad2e:cedb with SMTP id 6a1803df08f44-70dad2ed081mr83964606d6.43.1756141541424;
        Mon, 25 Aug 2025 10:05:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnj7pgLgYj0gnzZFl+kk2EVSGRa08xMAzv363arIwLdssNid6xlYMbYTH85va++EtXnTmBAA==
X-Received: by 2002:ad4:5ec5:0:b0:70d:ad2e:cedb with SMTP id 6a1803df08f44-70dad2ed081mr83963686d6.43.1756141540665;
        Mon, 25 Aug 2025 10:05:40 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da714727csm48194826d6.13.2025.08.25.10.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:05:39 -0700 (PDT)
Date: Mon, 25 Aug 2025 13:05:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, geert+renesas@glider.be,
	linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after
 resume
Message-ID: <aKyX4YJswZLuqA6Y@x1>
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Claudiu,

On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> This series disables clocks that remain unused after resume.
> This is necessary when the resume process is done with the help of the
> bootloader, as the bootloader enables various clocks when returning from
> resume.
> 
> On the RZ/G3S SoC (where this series was tested), the bootloader enables
> the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
> 1 is unused) and the clocks for a serial IP (unused by Linux).
> 
> Testing was done on the RZ/G3S SMARC Carrier II board.

Do you think that other boards would also benefit from this change? If
so, what do you think about putting the call to register_pm_notifier()
inside an __init block in clk.c so that this same change doesn't have to
be implemented across various clk drivers?

Alternatively, if this is board specific, could this be fixed in the
boot loader so that the clock that's not used by Linus is properly shut
down on resume?

I'm not the subsystem maintainer, so I'm not asking you to make any of
these changes.

Brian


