Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C336F240218
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 08:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbgHJGsm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 02:48:42 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:58784 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgHJGsl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 02:48:41 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07A6mdmq124989;
        Mon, 10 Aug 2020 01:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597042119;
        bh=hHauihgjY018384xDzaoNds3HNyQNEvZfsduZ65MYVY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=tsPwnDRI/sSBIzFr5u4/mWpVZYbNpfp451KlJkG30AN+vwwNsfgkroxjEHjQOXzbC
         0ZaiLVLczRy5Yl5q66WTShT6Xg6uYS5pWwm4lr0tK9Tqqk6afQB/K/Njh5ufp+GSfm
         4YCIpmiat2KvwOCGLhhF5QAb5o15Uk7LkhWPaJ60=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07A6mdGN031325
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Aug 2020 01:48:39 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 10
 Aug 2020 01:48:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 10 Aug 2020 01:48:38 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07A6mbi8005379;
        Mon, 10 Aug 2020 01:48:38 -0500
Subject: Re: [PATCH 1/8] card: Add a method to retrieve the device minor
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-renesas-soc@vger.kernel.org>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
 <20200806021807.21863-2-laurent.pinchart@ideasonboard.com>
 <0cf559a3-881b-9190-a108-35a298954b24@ti.com>
 <20200810055408.GE12018@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1c58412d-8b62-f3e3-42e1-46d26d7497b1@ti.com>
Date:   Mon, 10 Aug 2020 09:48:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200810055408.GE12018@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/08/2020 08:54, Laurent Pinchart wrote:

> Should I submit a v2 of the whole series to address your other concerns,
> or do you plan to already merge some of the patches ? In the latter
> case, feel free to give this small issue when applying :-) (along with
> s/get_minor/dev_minor/ in the commit message as pointed our by Sergei).

I fixed these, and pushed the series. We can ponder about the YUV bpps on top.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
