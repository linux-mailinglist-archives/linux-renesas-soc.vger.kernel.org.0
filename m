Return-Path: <linux-renesas-soc+bounces-11626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A36199F8F66
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF2C67A2BEE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBDA1A83EC;
	Fri, 20 Dec 2024 09:55:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843CB143744;
	Fri, 20 Dec 2024 09:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734688511; cv=none; b=Ycp5C/3O65kWg2J5ZGKNOWk3XxdM6Ca3FCVJhakAUlnLjOOR3cLYgfZenGy4k8HRvEA6rLViJ0zvWRp9UySaTMRZe/CBI8B0OMtbi6jfOQVmOWNbzlQjPqU3lKTGKwBbBDSQgGkKthjC/sTfAJ7CdRf9h7JTJ3yT3n7EpMTUhAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734688511; c=relaxed/simple;
	bh=504ErLDR/YIPoJzJYEryLgRSYyP2ipZph9sWcX6V5w8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qecXa98LPCxC9ErkDXru+8RlTp2A/yfAQv4gp/qApMcMo+/NUia0y4Dey0rvyABacnNB9YMLqLCkLNWcD+kVNtINUVpx19i5+LWRmSqeiA0wPFaYBmRkRYrCaOxNZ7jQNU6Q/LDmc2xDf6CLBrS8S59EuPQr2+FKL82v0Xl6N34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85bad7be09dso893696241.0;
        Fri, 20 Dec 2024 01:55:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734688508; x=1735293308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRFf8x09ddyunrMu+i2bEE42z9mG7cdTX58FKSuwlIM=;
        b=v56BqVuKZcS4Ra2PlRXsisBYUBGQiuIXvU1+BmHJhoZOiVUtuQPbhcioncO9riuewQ
         MQr9sJyRpU7rfPnX9AJxGa2BI2ZtLmnpnWOMzLI5b8JL+KBxtpDnHJhUi7w7J2Mw4Jsl
         2nJDfwUza1Ksc3ofUJ4a8eWL9K2r2tqgvLxl/mRWcc7Ntcn8ZIh8WPVmkG5T3uDOG2wx
         1Mx8LObPrTgkYV+BT6+sNFWu2iSYxVcEOmV6jvoKtPBExS8bCX3XBiPIFEIapoBNhaW7
         nsIBNuNGYWcM1vwCYZqWN+KYWDhDoi9Z8NYlLqav/imSljE/U75hxHnl70fOPIZLVLay
         IDsg==
X-Forwarded-Encrypted: i=1; AJvYcCVsXXM/bkQw59cXcn2CHQ1PeCxR5SMcjbjqB9PiQau+0JHgDdZ2sBLh0Fpgx5QdgIg0Gr+7JgV95DDYvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNvNus9AlalVzNcXkrjxNNVlmS97nhkBM7iG/SeJxj2tCY8fbJ
	p55JoiE3tgtVlAfZuSfokox7qTOgp/vbf5tdKWNQoFhl5EP51QBl7V28bsHj
X-Gm-Gg: ASbGncvpLxT1jg5kvhutgbGCRfHKbQ2ZFtEuQ03M+p18L50evdLNszILB4SQVZSuxtI
	EhOPH6nwjz5yDFgge3o5GVHuoaNf4tn5JDYj+0xvBDLe3I1CvJlR96q2lImYE1A9fKu/H/glpjE
	4HMpZ5vM/Jjs0evNrESGNRnAQfh5rp9bPBOPGl0nQO8pJPX20qBLsG94OSVh1WV/fiI4Pv1o0qj
	42C1NJcod6PCGrFxL2qxVc6mSvsvpxsgPBzQSjoOt0Y4Bdq6yuGoYR+jE4MfG3flZR19sCIyxGT
	vSWcDfE8v0G60eNI+/WB6Kk=
X-Google-Smtp-Source: AGHT+IFbOrwMwJyA3qW9ffLIRLzJ3fpReqcSE760czIt7+ZSyb5ahRaoaukXes4+HNbARkN0b8hOEg==
X-Received: by 2002:a05:6102:3713:b0:4b2:5d65:2c7d with SMTP id ada2fe7eead31-4b2cc35fa74mr2029526137.8.1734688508034;
        Fri, 20 Dec 2024 01:55:08 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf9a6eefsm527610137.8.2024.12.20.01.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:55:07 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51619b06a1cso939997e0c.3;
        Fri, 20 Dec 2024 01:55:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCCyAl8dGa7gYJJ+Va0x/Q1/VaeM4T7XxqycJzgXV8WLaBAjtzclelO0C73v8NkbLa4RItAOMSKdFOhQ==@vger.kernel.org
X-Received: by 2002:a05:6102:508a:b0:4b0:a67c:5817 with SMTP id
 ada2fe7eead31-4b2cc31fad8mr1865811137.5.1734688507598; Fri, 20 Dec 2024
 01:55:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241220093635.11218-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241220093635.11218-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Dec 2024 10:54:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTxLhhnD8zL6FjaMy+YV6NzZ_TCQtnM8PHzrfjejj5Dg@mail.gmail.com>
Message-ID: <CAMuHMdVTxLhhnD8zL6FjaMy+YV6NzZ_TCQtnM8PHzrfjejj5Dg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] hwmon: (lm75) add I3C support for P3T1755
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Fri, Dec 20, 2024 at 10:37=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Introduce I3C support by defining I3C accessors for regmap and
> implementing an I3C driver. Enable I3C for the NXP P3T1755.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v1:
> * don't parse i2c_device_id for a suitable sensor name but copy this
>   information to a specific struct for I3C devices
>   (frankly, I liked the previous solution better)
>
> * not really a change. I decided against using cpu_to_be/le* helpers.
>   It looks clumsy when operating on an array of u8 with them IMHO.

That is why we have {ge,pu}t_unaligned_[bl]e*()...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

