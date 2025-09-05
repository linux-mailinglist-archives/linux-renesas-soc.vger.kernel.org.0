Return-Path: <linux-renesas-soc+bounces-21497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC984B45B63
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 17:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61DCF5E0087
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 14:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E2F2F7AB8;
	Fri,  5 Sep 2025 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gNy9tD/9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AD01DDA24
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Sep 2025 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084307; cv=none; b=HexQpZef8gywAMgHka/1/724LvBKExLlq8YZJiIWJ3o+of0YqkSuo3Qt8IarGUx7gYE4JPVD/loKpNlOjibYjfUAa0gJtr8BvWu2hbzpUzWWvUKz0/mIf/DqCYlZKuhruv3KvFgnW+NqjssblQD/5ooHBj/az6ytX6OmHMHWLGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084307; c=relaxed/simple;
	bh=G56oMzOjsYVrjlf9HgLRUbAv1aA5ITWzZQDv2p0HDok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=neM5MRB5NONQGtAB2pyOSNwyJfQSWHT02PU+04VBIZNcS4pJscRW9CqdppCxNOs76mb+n+LwuG3uAPxd5oNUhkhBs93sKOqg5SlP/Otr95k6/CEQ+DWGCyCVHFAa4BH7p0EAuPNtLQf2Nop2pDZ68FvTjXYJ2qbgaVZecMLR5V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gNy9tD/9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757084304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8sWmtjiwnBLMCNvHDa+POELZazfSy48Vst2ZjiMCgD8=;
	b=gNy9tD/9qoZn5TGsep5PLHjr6Uo99AJZypF4HbLE3cve3rM+7RX0iLHeJsEULg4oowCHqv
	vhY/z59Whka20eNbp8U5FmXyEzubNvL7fn0xEzluN0YAd1gVJGup/cyGjl1DAzh9R3hnW0
	EbPNPMYIWm11n44hFNVXyLuX35v9fu0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-ZUrjb5mCNRG926gVA5WLFQ-1; Fri, 05 Sep 2025 10:58:23 -0400
X-MC-Unique: ZUrjb5mCNRG926gVA5WLFQ-1
X-Mimecast-MFC-AGG-ID: ZUrjb5mCNRG926gVA5WLFQ_1757084303
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-804512c4373so456742185a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Sep 2025 07:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757084302; x=1757689102;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sWmtjiwnBLMCNvHDa+POELZazfSy48Vst2ZjiMCgD8=;
        b=SQtmotgxfd5nR5KUYzhNDJuvVAYOVre60itHgTxttdcRO9CYyTSfC8cSF0oO4jHgdA
         /ywnix3EV3KOrxFKgnf6zjUZ36ToYY7VaznawNaox/dyMtuQlsKBuVIxDgFcv7FqlU9c
         kxV9B7K1KgbfNS/SPYU/qPIzc67sAKi7KfomfuEcqtT2AIdiwjs86j1wgRdlalTMQcMP
         6s+I6Vo0yM1jin8igP0SLTKmJhWtH3dOX3eO2eocAHso3sNHo6jk00CguHHYLmTJOGxz
         ebU6l/Qgh+AjPpDdFgTfpeXtQLo8HtckyHARJI2qfvhFwIUX9KdwO/SAt1KvBc6kLlWW
         1Jdg==
X-Forwarded-Encrypted: i=1; AJvYcCV68B9QZJ/R53MV7Z1/wSoMg/C+vTiKsfyx2k41oL51QPc57frmSeYUyVzCI17NTi2uTVJDiugdBnQ4Rj4807cXGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWxn8SDjlZ6WTWHbp6uMg8qro+nxL08AVCLmBCoM+tQQYCJ/Qq
	Y9aNH+jqnfq7Ha5AIxUOX2ugelUlJTG9d6rj1cI6bgARjW/HZ1HEmlVTNXYMMOSiyIE07GK8nOV
	2PZYJBK3srJ330h2OmH5E/63draihOYar7jiCD5VlHPlj3n275Vlg+1GeH94wROCKZgAJwNvd
X-Gm-Gg: ASbGncscjI9fckvAhpRHwrRHG+tRwlJnvxGzYSgOihkD/c4CePCe70/+5/MDViGuBbf
	sWQTqPJrtQ2Nm8NJiv0hEkq5MPXSKTypX9dB4z9o/eiPiJXQieP7nlos1liRhIV2OzW4g5nqzXK
	yMLUA3fFq7fVqCwzj3wG9greC05gUBjpR29TB/7ShqgBvf++wPLG1J88VueX7P+IoQFIutggg6y
	59tND8HgezObvsDbh6w+2RHfpXevP2pIGIX4PZWokwlrr3iK+x81vqy+h4twFjGNWe6ZkuVU0Te
	7Ghu4444drgA+xOCA5/aR71uH304gx8H5z9VW2YCdtoHOI6L6ds9mXacfwtsky39S77Rf/A+ZQV
	Ppp/Otlx5lKj3c3sB/tQ=
X-Received: by 2002:a05:620a:2585:b0:7f2:d9d3:f5da with SMTP id af79cd13be357-7ff284b1c36mr2949666385a.33.1757084302588;
        Fri, 05 Sep 2025 07:58:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRAz5VwtsVUROYHU2rQWET40PGS5RQKqxfBOTI59DzOUvzzQv/XtrECGGTQvfuYUXLNygGQQ==
X-Received: by 2002:a05:620a:2585:b0:7f2:d9d3:f5da with SMTP id af79cd13be357-7ff284b1c36mr2949663185a.33.1757084302145;
        Fri, 05 Sep 2025 07:58:22 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80b65dea673sm436066085a.71.2025.09.05.07.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:58:21 -0700 (PDT)
Date: Fri, 5 Sep 2025 10:58:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] MAINTAINERS: Add entries for Renesas Versaclock {3,7}
 clock drivers
Message-ID: <aLr6ixZr4Lek5p9X@x1>
References: <20250905143441.7082-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905143441.7082-1-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Sep 05, 2025 at 03:34:38PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add entries for Renesas versaclock 3 clock driver. While at it
> add myself as maintainer for versaclock 7 clock driver as Alex's
> email address bounces.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


